# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  caption    :text
#  equipment  :string
#  image      :string
#  location   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_posts_on_user_id                 (user_id)
#  index_posts_on_user_id_and_created_at  (user_id,created_at)
#

# RSpec.describe 'ポスト', type: :model do
# before do
# @user = FactoryBot.create(:user)
# @post = FactoryBot.create(:post, user: @user)
# end

# describe '存在性の検証' do
# it '画像がある場合、有効であること' do
# post = Post.new(
# image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')),
# user: @user
# )
# expect(post).to be_valid
# end

# it '画像がない場合、無効であること' do
# @post.image = nil
# @post.valid?
# expect(@post).to_not be_valid
# end
# end
# end
