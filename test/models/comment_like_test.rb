# == Schema Information
#
# Table name: comment_likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment_id :integer
#  user_id    :integer
#
# Indexes
#
#  index_comment_likes_on_comment_id  (comment_id)
#  index_comment_likes_on_user_id     (user_id)
#
require 'test_helper'

class CommentLikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
