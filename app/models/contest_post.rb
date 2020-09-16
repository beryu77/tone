# == Schema Information
#
# Table name: contest_posts
#
#  id         :bigint           not null, primary key
#  caption    :text(65535)
#  equipment  :string(255)
#  image      :string(255)
#  location   :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class ContestPost < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :user_id, presence: true
  validates :image, presence: true
  validates :caption, length: { maximum: 1000 }

  validate :image_size

  private

  # アップロードされた画像のサイズをバリデーションする
  def image_size
    errors.add(:image, '15MBまでの画像を投稿してください') if image.size > 15.megabytes
  end
end
