require 'rails_helper'

RSpec.describe '投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it '新規投稿する', js: true do
    visit root_path

    # ログインする
    find('.navbar-toggler-icon').click
    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン'

    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    expect(current_path).to eq "/users/#{@user.id}"

    # 新規投稿する
    find('.navbar-toggler-icon').click
    click_link '新規投稿'
    expect(current_path).to eq new_post_path
    expect(page).to have_content '撮影場所'

    attach_file 'post[image]', "#{Rails.root}/spec/fixtures/test.jpg", make_visible: true
    fill_in '撮影場所', with: '大阪'
    fill_in '機材', with: 'CANON/kiss'
    fill_in 'キャプション', with: '天気がよかったです'
    click_button '投稿する'
    sleep 3

    post = Post.first
    aggregate_failures do
      expect(post.location).to eq '大阪'
      expect(post.equipment).to eq 'CANON/kiss'
      expect(post.caption).to eq '天気がよかったです'
    end

    # 投稿を編集する
    click_link nil, href: "/posts/#{post.id}"
    expect(current_path).to eq "/posts/#{post.id}"
    click_link '編集'
    expect(current_path).to eq edit_post_path(post)

    fill_in 'キャプション', with: '今日は少し寒かったです'
    click_button '投稿する'
    sleep 1

    expect(current_path).to eq "/posts/#{post.id}"
    expect(page).to_not have_content '天気がよかったです'
    expect(page).to have_content '今日は少し寒かったです'

    # 投稿を削除する
    # click_link '削除'
    # page.accept_confirm '削除しますか？' do
    # delete_link.click
    # end
    # sleep 1

    # expect(page).to have_content "投稿を削除しました"
    # expect(Post.where(id: post.id)).to be_empty
  end
end
