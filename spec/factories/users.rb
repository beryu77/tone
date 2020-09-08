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