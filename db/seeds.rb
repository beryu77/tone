# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: '管理者',
             email: 'admin@example.com',
             password: '12345678',
             password_confirmation: '12345678',
             avatar: File.open("./db/fixtures/avatar/admin.JPG", ?r),
             profile: 'このアカウントは管理者アカウントです。',
             admin: true
             )

User.create!(name: 'ゲストユーザー',
             email: 'guest@example.com',
             password: '12345678',
             password_confirmation: '12345678',
             avatar: File.open("./db/fixtures/avatar/avatar-3.JPG", ?r),
             profile: 'ゲストアカウントです',
             admin: false
             )

User.create!(name:"渡邉隆太郎", email: "test1@test.co.jp", password: "password", 
             profile: '写真を撮ることは最高の癒しです！',
             avatar: File.open("./db/fixtures/avatar/avatar-4.JPG", ?r))

User.create!(name:"前田宗弘", email: "test2@test.co.jp", password: "password", 
            profile: '最近はポートレイトに力を入れています！',
            avatar: File.open("./db/fixtures/avatar/avatar-5.JPG", ?r))

User.create!(name:"小畑瑞希", email: "test3@test.co.jp", password: "password", 
             profile: '写真初心者です！',
             avatar: File.open("./db/fixtures/avatar/avatar-6.JPG", ?r))

User.create!(name:"上田昌輝", email: "test4@test.co.jp", password: "password", 
             profile: '写真歴は7年ですが、腕前はまだまだです。',
             avatar: File.open("./db/fixtures/avatar/avatar-7.JPG", ?r))

User.create!(name:"柏木麻菜", email: "test5@test.co.jp", password: "password", 
             profile: '個展に向けて準備中です！',
             avatar: File.open("./db/fixtures/avatar/avatar-8.JPG", ?r))

User.create!(name:"杉山大地", email: "test6@test.co.jp", password: "password", 
             profile: '外国で写真を撮るのが一番の楽しみです。',
             avatar: File.open("./db/fixtures/avatar/avatar-9.JPG", ?r))

User.create!(name:"廣田聖", email: "test7@test.co.jp", password: "password", 
             profile: '空の写真ばかり撮影してます。',
             avatar: File.open("./db/fixtures/avatar/avatar-10.JPG", ?r))

User.create!(name:"船岡大知", email: "test8@test.co.jp", password: "password", 
             profile: '最近モノクロ写真にハマっています！',
             avatar: File.open("./db/fixtures/avatar/avatar-11.JPG", ?r))

User.create!(name:"山本美羽", email: "test1@test.co.jp", password: "password", 
             profile: 'お菓子作りが大好きです！',
             avatar: File.open("./db/fixtures/avatar/avatar-12.JPG", ?r))

User.create!(name:"坂田大樹", email: "test1@test.co.jp", password: "password", 
             profile: '全国津々浦々、橋の写真を撮り歩いています。',
             avatar: File.open("./db/fixtures/avatar/avatar-13.JPG", ?r))

