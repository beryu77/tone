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
require 'test_helper'

class ContestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
