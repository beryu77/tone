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
require 'test_helper'

class ContestPostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
