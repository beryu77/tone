# == Schema Information
#
# Table name: silver_prizes
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  contest_post_id :integer
#  user_id         :integer
#
require 'test_helper'

class SilverPrizeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
