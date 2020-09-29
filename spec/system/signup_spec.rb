require 'rails_helper'

RSpec.describe '新規ユーザー登録', type: :system do
  before do
    user = FactoryBot.create(:user)
  end

  it '新規ユーザーを作成してログインする（成功）' do
    visit root_path
    find('#head').click_link '新規登録'
    expect(current_path).to eq signup_path
    expect(page).to have_content '新規ユーザー登録'

    fill_in 'ユーザー名（10文字以内）', with: 'taro'
    fill_in 'メールアドレス', with: 'taro@example.com'
    fill_in 'パスワード（8文字以上）', with: 'password'
    fill_in '確認用パスワード', with: 'password'

    click_button 'ユーザー登録'
    expect(page).to have_content 'taroさん、Toneへようこそ！'
  end

  it '新規ユーザーを作成してログインする（失敗）' do
    visit root_path
    find('#head').click_link '新規登録'
    expect(current_path).to eq signup_path
    expect(page).to have_content '新規ユーザー登録'

    fill_in 'ユーザー名（10文字以内）', with: 'a' * 11
    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'パスワード（8文字以上）', with: 'password'
    fill_in '確認用パスワード', with: '12345678'

    click_button 'ユーザー登録'
    expect(page).to have_content 'ユーザー名は10文字以内で入力してください'
    expect(page).to have_content 'メールアドレスはすでに存在します'
    expect(page).to have_content '確認用パスワードとパスワードの入力が一致しません'
  end
end
