# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  admin           :boolean          default(FALSE)
#  avatar          :string
#  email           :string
#  name            :string
#  password_digest :string
#  profile         :text
#  remember_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email { 'test@example.com' }
    password { 'password' }
  end

  factory :admin, class: User do
    name { '管理者' }
    email { 'admin@example.com' }
    password { '12345678' }
    admin { true }
  end

  factory :guest, class: User do
    name { 'ゲストユーザー' }
    email { 'guest@example.com' }
    password { '12345678' }
  end
end
