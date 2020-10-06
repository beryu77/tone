# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :comment_likes
  has_many :comment_user, through: :comment_likes, source: :user
  has_many :notifications, dependent: :destroy

  validates :post_id, presence: true
  validates :user_id, presence: true
  validates :comment, presence: true, length: { maximum: 100 }
end
