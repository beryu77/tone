# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_favorites_on_post_id  (post_id)
#  index_favorites_on_user_id  (user_id)
#
class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :post_id, presence: true
  validates :user_id, presence: true
  validates_uniqueness_of :post_id, scope: :user_id
end
