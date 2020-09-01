# == Schema Information
#
# Table name: silver_prizes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
class SilverPrize < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :post_id, presence: true
  validates :user_id, presence: true 
end
