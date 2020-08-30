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
require 'test_helper'

class ContestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
