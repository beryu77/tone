# == Schema Information
#
# Table name: contests
#
#  id                 :bigint           not null, primary key
#  condition          :text(65535)
#  gold_explanation   :string(255)
#  gold_prize         :string(255)
#  gold_title         :string(255)
#  image              :string(255)
#  main               :text(65535)
#  period             :string(255)
#  silver_explanation :string(255)
#  silver_prize       :string(255)
#  silver_title       :string(255)
#  title              :string(255)
#  win_a_prize        :string(255)
#  win_explanation    :string(255)
#  win_title          :string(255)
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
    errors.add(:image, '15MBまでの画像を投稿してください') if image.size > 15.megabytes
  end
end
