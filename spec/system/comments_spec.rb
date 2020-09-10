require 'rails_helper'

RSpec.describe 'コメント', type: :system do
  before do
    @user = FactoryBot.create(:user)
    FactoryBot.create(:post, user: @user)
  end

  it '既存の投稿にコメントして、削除する', js: true do
    visit root_path

    # ログインする
    find(".navbar-toggler-icon").click
    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン'

    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    expect(page).to have_content 'テストユーザー'

    # 既存の投稿に移動する
    find(".navbar-toggler-icon").click
    click_link '新着'
    post = @user.posts.first
    expect(page).to have_link 'a', href: "/posts/#{post.id}"
    click_link nil, href: "/posts/#{post.id}"
    expect(current_path).to eq "/posts/#{post.id}"

    # コメントを投稿する
    fill_in 'comment[comment]', with: '良い写真ですね'
    click_button 'コメントを送信'
    expect(page).to have_content '良い写真ですね'
  end
end
