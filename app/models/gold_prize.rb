# == Schema Information
#
# Table name: gold_prizes
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  contest_post_id :integer
#  user_id         :integer
#
class GoldPrize < ApplicationRecord
  belongs_to :contest_post
  belongs_to :user
  validates :contest_post_id, presence: true
  validates :user_id, presence: true 
end
