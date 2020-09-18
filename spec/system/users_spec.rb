require 'rails_helper'

RSpec.describe 'ユーザー', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ユーザープロフィールを編集する' do
    visit root_path

    # ログインする
    click_link 'ログイン'
    expect(current_path).to eq login_path
    expect(page).to have_content 'ログイン'

    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    expect(page).to have_content 'テストユーザー'

    click_link 'プロフィール編集'
    expect(current_path).to eq edit_user_path(@user)
    expect(page).to have_content 'ユーザー名（20文字以内）'
    expect(page).to have_content 'メールアドレス'
    expect(page).to have_content '自己紹介（150文字以内）'

    attach_file 'user[avatar]', "#{Rails.root}/spec/fixtures/test_avatar.png", make_visible: true
    fill_in 'ユーザー名（20文字以内）', with: 'goro'
    fill_in 'メールアドレス', with: 'goro@example.com'
    fill_in '自己紹介', with: '初めまして。'
    click_button '変更を保存する'
    expect(current_path).to eq user_path(@user)
    expect(page).to have_content 'プロフィールの編集が完了しました'

    @user.reload
    aggregate_failures do
      expect(@user.name).to eq 'goro'
      expect(@user.email).to eq 'goro@example.com'
      expect(@user.profile).to eq '初めまして。'
    end
  end
end
