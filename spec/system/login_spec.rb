require 'rails_helper'

RSpec.describe 'Login', type: :system do

  describe '通常ユーザー' do
    before do
      user = FactoryBot.create(:user)
    end

    context '通常ユーザーとしてログイン/ログアウトする' do
      before do
        visit root_path
        find(".navbar-toggler-icon").click
        click_link 'ログイン'
      end

      it 'ログイン/ログアウトに成功する' do
        expect(current_path).to eq login_path
        expect(page).to have_content 'ログイン'

        fill_in 'メールアドレス', with: 'test@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        #expect(current_path).to eq "/users/#{user.id}"
        expect(page).to have_content 'テストユーザー'

        find(".navbar-toggler-icon").click
        click_link 'メニュー'
        click_link 'ログアウト'

        find(".navbar-toggler-icon").click
        expect(page).to have_link '新規登録'
        expect(page).to have_link 'ログイン'
      end

      it 'ログインに失敗する' do
        expect(current_path).to eq login_path
        expect(page).to have_content 'ログイン'

        fill_in 'メールアドレス', with: 'taro@example.com'
        fill_in 'パスワード', with: 'taro_password'
        click_button 'ログイン'
        expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
      end
    end
  end

  describe 'ゲストユーザー' do
    before do
      guest = FactoryBot.create(:guest)
    end

    it 'ゲストユーザーとしてログインする' do
      visit root_path
      find(".navbar-toggler-icon").click
      click_link 'ログイン'
      expect(current_path).to eq login_path
      expect(page).to have_content 'ログイン'

      fill_in 'メールアドレス', with: 'guest@example.com'
      fill_in 'パスワード', with: '12345678'
      click_button 'ログイン'
      expect(page).to have_content 'ゲストユーザー'
    end

    it 'ゲストログインボタンからログインする' do
      visit root_path
      find(".navbar-toggler-icon").click
      click_link 'ログイン'
      expect(current_path).to eq login_path
      expect(page).to have_content 'ゲストログイン'

      click_on 'ゲストログイン'
      expect(page).to have_content 'ゲストユーザー'
    end
  end

  describe '管理者ユーザー' do
    before do
      admin = FactoryBot.create(:admin)
      guest = FactoryBot.create(:guest)
      FactoryBot.create(:post, user: guest)
    end

    it '管理者としてログインする' do
      visit root_path
      find(".navbar-toggler-icon").click
      click_link 'ログイン'
      expect(current_path).to eq login_path
      expect(page).to have_content 'ログイン'

      fill_in 'メールアドレス', with: 'admin@example.com'
      fill_in 'パスワード', with: '12345678'
      click_button 'ログイン'
      expect(page).to have_content '管理者'
      find(".navbar-toggler-icon").click
      expect(page).to have_content 'ユーザー一覧'
    end

    it 'ユーザー一覧からユーザーを削除する' do
      visit root_path
      find(".navbar-toggler-icon").click
      click_link 'ログイン'
      fill_in 'メールアドレス', with: 'admin@example.com'
      fill_in 'パスワード', with: '12345678'
      click_button 'ログイン'

      find(".navbar-toggler-icon").click
      click_link 'ユーザー一覧'
      expect(current_path).to eq users_path
      expect(page).to have_content 'このユーザーを削除する'

      delete_link = find_link 'このユーザーを削除する'
      page.accept_confirm 'このユーザーを削除しますか？' do
        delete_link.click
      end
      expect(current_path).to eq users_path
      expect(page).to have_content "ユーザーを削除しました"
      expect(User.where(email: 'test@example.com')).to be_empty
    end
  end
end





  