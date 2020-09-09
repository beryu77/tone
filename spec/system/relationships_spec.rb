require 'rails_helper'

RSpec.describe 'フォロー', type: :system do
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

  it 'ユーザーをフォロー/フォロー解除する', js: true do
    visit root_path

    # taroがログインする
    find(".navbar-toggler-icon").click
    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン'

    fill_in 'メールアドレス', with: 'taro@example.com'
    fill_in 'パスワード', with: 'password_taro'
    click_button 'ログイン'
    expect(page).to have_content 'taro'

    # jiroのページへ移動する
    find(".navbar-toggler-icon").click
    click_link '新着'
    click_link 'jiro'
    expect(current_path).to eq "/users/#{@jiro.id}"

    # jiroをフォローする
    expect(page).to have_content 'フォロワー 0'
    expect do
    click_button 'フォロー'
    expect(page).to have_content 'フォロワー 1'
    expect(page).to_not have_content 'フォロワー 0'
    #expect(page).to have_content 'フォロー中'
    end.to change(@taro.following, :count).by(1) &
           change(@jiro.followers, :count).by(1)

    # マイページ（taro）に移動する
    visit user_path(@taro)
    expect(current_path).to eq "/users/#{@taro.id}"
    find(".navbar-toggler-icon").click
    click_link 'フォロー'
    expect(page).to have_content 'フォロー 1'
    expect(page).to have_content 'jiro'
    #expect(page).to have_content 'フォロー中'

    # jiroのフォローを解除する
    expect do
      click_link 'jiro'
      click_button 'フォロー中'
      expect(page).to have_content 'フォロワー 0'
      expect(page).to_not have_content 'フォロワー 1'
      expect(page).to have_content 'フォロー'
    end.to change(@taro.following, :count).by(-1) &
           change(@jiro.followers, :count).by(-1)

    visit user_path(@taro)
    click_link 'フォロー'
    expect(page).to have_content '誰もフォローしていません'
  end
end
