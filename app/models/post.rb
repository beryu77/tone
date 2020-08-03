# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  caption    :text
#  equipment  :string
#  image      :string
#  location   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_posts_on_user_id                 (user_id)
#  index_posts_on_user_id_and_created_at  (user_id,created_at)
#
class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  default_scope -> { order(created_at: :desc) }   #投稿の順序を降順にする
  validates :user_id, presence: true
  validates :caption, length: { maximum: 1000 }
  validate :image_size

  private

  # アップロードされた画像のサイズをバリデーションする
  def image_size 
    if image.size > 5.megabytes
        errors.add(:image, "5MBまでの画像を投稿してください")
    end
  end
end
