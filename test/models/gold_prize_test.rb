# == Schema Information
#
# Table name: gold_prizes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
require 'test_helper'

class GoldPrizeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
