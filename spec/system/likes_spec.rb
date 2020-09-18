require 'rails_helper'

RSpec.describe 'いいね', type: :system do
  before do
    @taro = FactoryBot.create(:user,
                              name: 'taro',
                              email: 'taro@example.com',
                              password: 'password_taro')

    @jiro = FactoryBot.create(:user,
                              name: 'jiro',
                              email: 'jior@example.com',
                              password: 'password_jiro')
    FactoryBot.create(:post, user: @jiro)
  end

  it '既存の投稿にいいね/いいね解除する', js: true do
    visit root_path

    # taroがログインする
    #find('.navbar-toggler-icon').click
    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン'

    fill_in 'メールアドレス', with: 'taro@example.com'
    fill_in 'パスワード', with: 'password_taro'
    click_button 'ログイン'
    expect(page).to have_content 'taro'

    # jiroの既存の投稿に移動する
    #find('.navbar-toggler-icon').click
    click_link '新着'
    post = @jiro.posts.first
    expect(page).to have_link 'a', href: "/posts/#{post.id}"
    click_link nil, href: "/posts/#{post.id}"
    expect(current_path).to eq "/posts/#{post.id}"

    # 投稿にいいね！する
    expect(page).to have_content 'いいね！'
    expect do
      click_link 'いいね！'
      expect(page).to have_content 'いいね済'
      expect(page).to_not have_content 'いいね！'
    end.to change(post.likes, :count).by(1)

    # いいね！解除する
    expect(page).to have_content 'いいね済'
    expect do
      click_link 'いいね済'
      expect(page).to have_content 'いいね！'
      expect(page).to_not have_content 'いいね済'
    end.to change(post.likes, :count).by(-1)
  end
end
