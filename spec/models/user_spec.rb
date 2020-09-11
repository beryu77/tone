require 'rails_helper'

RSpec.describe 'ユーザー', type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it '名前、メールアドレス、パスワードがある場合、有効であること' do
    user = User.new(
      name: 'TestUser',
      email: 'test@expample.com',
      password: 'password'
    )
    expect(user).to be_valid
  end

  describe '存在性の検証' do
    it '名前がない場合、無効であること' do
      @user.name = @user.password_confirmation = ' ' * 8
      @user.valid?
      expect(@user).to_not be_valid
    end

    it 'メールアドレスがない場合、無効であること' do
      @user.email = ''
      @user.valid?
      expect(@user).to_not be_valid
    end

    it 'パスワードがない場合、無効であること' do
      @user.password = ' ' * 8
      @user.valid?
      expect(@user).to_not be_valid
    end
  end

  describe '文字数の検証' do
    it '名前が20文字以内の場合、有効であること' do
      @user.name = 'a' * 20
      expect(@user).to be_valid
    end

    it '名前が11文字以上の場合、無効であること' do
      @user.name = 'a' * 21
      expect(@user).to_not be_valid
    end

    it '自己紹介が150文字以内の場合、有効であること' do
      @user.profile = 'a' * 150
      expect(@user).to be_valid
    end

    it '自己紹介が151文字以上の場合、無効であること' do
      @user.profile = 'a' * 151
      expect(@user).to_not be_valid
    end

    it 'メールアドレスが255文字以内の場合、有効であること' do
      @user.email = 'a' * 243 + '@example.com'
      expect(@user).to be_valid
    end

    it 'メールアドレスが255文字を越える場合、無効であること' do
      @user.email = 'a' * 244 + '@example.com'
      @user.valid?
      expect(@user.errors).to be_added(:email, :too_long, count: 255)
    end

    it 'パスワードが8文字以上の場合、有効であること' do
      @user.password = @user.password_confirmation = 'a' * 8
      expect(@user).to be_valid
    end

    it 'パスワードが8文字未満の場合、無効であること' do
      @user.password = @user.password_confirmation = 'a' * 7
      @user.valid?
      expect(@user.errors).to be_added(:password, :too_short, count: 8)
    end
  end

  describe '一意性の検証' do
    it '重複したメールアドレスの場合、無効であること' do
      user1 = FactoryBot.create(:user, name: 'taro', email: 'taro@example.com')
      user2 = FactoryBot.build(:user, name: 'jiro', email: user1.email)
      expect(user2).to_not be_valid
    end

    #it 'メールアドレスは大文字小文字を区別せず扱うこと' do
      #FactoryBot.create(:user, email: 'sample@example.com')
      #duplicate_user = FactoryBot.build(:user, email: 'SAMPLE@EXAMPLE.COM')
      #duplicate_user.valid?
      #expect(duplicate_user.errors).to be_added(:email, :taken, value: 'sample@example.com')
    #end
  end
end