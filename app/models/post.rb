# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  caption    :text(65535)
#  equipment  :string(255)
#  image      :string(255)
#  location   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_posts_on_user_id                 (user_id)
#  index_posts_on_user_id_and_created_at  (user_id,created_at)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  default_scope -> { order(created_at: :desc) } # 投稿の順序を降順にする

  validates :user_id, presence: true
  validates :image, presence: true
  validates :caption, length: { maximum: 1000 }
  validate :image_size

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  has_many :notifications, dependent: :destroy

  # お気に入りされているか判定
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  # いいね通知の作成
  def create_notification_like(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  # コメント通知の作成
  def create_notification_comment(current_user, comment_id)
    notification = current_user.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

  private

  # アップロードされた画像のサイズをバリデーションする
  def image_size
    errors.add(:image, '15MBまでの画像を投稿してください') if image.size > 15.megabytes
  end
end

