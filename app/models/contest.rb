# == Schema Information
#
# Table name: contests
#
#  id                 :integer          not null, primary key
#  condition          :text
#  gold_explanation   :string
#  gold_prize         :string
#  gold_title         :string
#  image              :string
#  main               :text
#  silver_explanation :string
#  silver_prize       :string
#  silver_title       :string
#  title              :string
#  win_a_prize        :string
#  win_explanation    :string
#  win_title          :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#
class Contest < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
  mount_uploader :gold_prize, ImageUploader
  mount_uploader :silver_prize, ImageUploader
  mount_uploader :win_a_prize, ImageUploader

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
