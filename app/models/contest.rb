# == Schema Information
#
# Table name: contests
#
#  id         :integer          not null, primary key
#  condition  :text
#  image      :string
#  main       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Contest < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader

  validates :user_id, presence: true
  validates :image, presence: true
  validates :main, presence: true
  validates :title, presence: true
  validates :condition, presence: true
  validate :image_size

private

  # アップロードされた画像のサイズをバリデーションする
  def image_size 
    if image.size > 15.megabytes
        errors.add(:image, "15MBまでの画像を投稿してください")
    end
  end
end
