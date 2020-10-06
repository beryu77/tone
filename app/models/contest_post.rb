# == Schema Information
#
# Table name: contest_posts
#
#  id         :integer          not null, primary key
#  caption    :text
#  equipment  :string
#  image      :string
#  location   :string
#  title      :string
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
