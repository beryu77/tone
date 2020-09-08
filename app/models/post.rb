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
  default_scope -> { order(created_at: :desc) }   #投稿の順序を降順にする

  validates :user_id, presence: true
  validates :image, presence: true
  validates :caption, length: { maximum: 1000 }

  validate :image_size

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  # お気に入りされているか判定
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  private

  # アップロードされた画像のサイズをバリデーションする
  def image_size 
    if image.size > 15.megabytes
        errors.add(:image, "15MBまでの画像を投稿してください")
    end
  end
end
