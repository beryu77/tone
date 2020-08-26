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
class CommentLike < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  validates :comment_id, presence: true
  validates :user_id, presence: true
  validates_uniqueness_of :comment_id, scope: :user_id
end
