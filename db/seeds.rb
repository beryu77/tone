# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザー
User.create!(name: 'ゲストユーザー',
             email: 'guest@example.com',
             password: '12345678',
             password_confirmation: '12345678',
             avatar: File.open("./db/fixtures/avatar/avatar-3.JPG", ?r),
             profile: 'ゲストアカウントです',
             admin: false
             )

User.create!(name: '管理者',
             email: 'admin@example.com',
             password: '12345678',
             password_confirmation: '12345678',
             avatar: File.open("./db/fixtures/avatar/admin.JPG", ?r),
             profile: 'このアカウントは管理者アカウントです。',
             admin: true
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

User.create!(name:"山本美羽", email: "test9@test.co.jp", password: "password", 
             profile: 'お菓子作りが大好きです！',
             avatar: File.open("./db/fixtures/avatar/avatar-12.JPG", ?r))

User.create!(name:"坂田大樹", email: "test10@test.co.jp", password: "password", 
             profile: '全国津々浦々、橋の写真を撮り歩いています。',
             avatar: File.open("./db/fixtures/avatar/avatar-13.JPG", ?r))

# フォロー関係
# ゲストユーザー
Relationship.create!(followed_id:1,follower_id:2)
Relationship.create!(followed_id:2,follower_id:1)
Relationship.create!(followed_id:1,follower_id:3)
Relationship.create!(followed_id:3,follower_id:1)
Relationship.create!(followed_id:1,follower_id:4)
Relationship.create!(followed_id:4,follower_id:1)
Relationship.create!(followed_id:1,follower_id:5)
Relationship.create!(followed_id:5,follower_id:1)
Relationship.create!(followed_id:1,follower_id:6)
Relationship.create!(followed_id:6,follower_id:1)
Relationship.create!(followed_id:1,follower_id:7)
Relationship.create!(followed_id:7,follower_id:1)
Relationship.create!(followed_id:1,follower_id:8)
Relationship.create!(followed_id:8,follower_id:1)
Relationship.create!(followed_id:1,follower_id:9)
Relationship.create!(followed_id:9,follower_id:1)
Relationship.create!(followed_id:1,follower_id:10)
Relationship.create!(followed_id:10,follower_id:1)
Relationship.create!(followed_id:1,follower_id:11)
Relationship.create!(followed_id:11,follower_id:1)
Relationship.create!(followed_id:1,follower_id:12)
Relationship.create!(followed_id:12,follower_id:1)

# その他のユーザー
Relationship.create!(followed_id:2,follower_id:10)
Relationship.create!(followed_id:2,follower_id:12)

Relationship.create!(followed_id:3,follower_id:7)
Relationship.create!(followed_id:3,follower_id:9)

Relationship.create!(followed_id:4,follower_id:3)
Relationship.create!(followed_id:4,follower_id:11)

Relationship.create!(followed_id:5,follower_id:5)
Relationship.create!(followed_id:5,follower_id:6)

Relationship.create!(followed_id:6,follower_id:2)
Relationship.create!(followed_id:6,follower_id:4)

Relationship.create!(followed_id:7,follower_id:9)
Relationship.create!(followed_id:7,follower_id:12)

Relationship.create!(followed_id:8,follower_id:10)
Relationship.create!(followed_id:8,follower_id:12)

Relationship.create!(followed_id:9,follower_id:7)
Relationship.create!(followed_id:9,follower_id:9)

Relationship.create!(followed_id:10,follower_id:8)
Relationship.create!(followed_id:10,follower_id:11)

Relationship.create!(followed_id:11,follower_id:3)
Relationship.create!(followed_id:11,follower_id:6)

Relationship.create!(followed_id:12,follower_id:5)
Relationship.create!(followed_id:12,follower_id:7)

# 投稿
Post.create!(user_id: 1,
             image: File.open("./db/fixtures/post/3.JPG", ?r),
             caption: '礼拝'
             )
Post.create!(user_id: 1,
             image: File.open("./db/fixtures/post/4.JPG", ?r),
             caption: '本願寺'
             )
Post.create!(user_id: 1,
             image: File.open("./db/fixtures/post/5.JPG", ?r),
             caption: '根'
             )
Post.create!(user_id: 1,
             image: File.open("./db/fixtures/post/6.JPG", ?r),
             caption: '鞍馬のベンチ',
             equipment: 'Nikon_D5100',
             location: '鞍馬'
             )
Post.create!(user_id: 1,
             image: File.open("./db/fixtures/post/7.JPG", ?r),
             caption: '御手洗',
             equipment: 'Sony_α7ⅱ',
             location: '石清水八幡宮'
             )
Post.create!(user_id: 1,
             image: File.open("./db/fixtures/post/8.JPG", ?r),
             caption: '遭遇',
             equipment: 'Sony_α7ⅱ',
             location: '宮崎'
             )
Post.create!(user_id: 3,
             image: File.open("./db/fixtures/post/9.JPG", ?r),
             caption: '建仁寺',
             equipment: 'Nikon_D5100',
             location: '建仁寺'
             )
Post.create!(user_id: 3,
             image: File.open("./db/fixtures/post/10.JPG", ?r),
             caption: '鵜戸神宮',
             equipment: 'Sony_α7ⅱ',
             location: '鞍馬'
             )
Post.create!(user_id: 4,
             image: File.open("./db/fixtures/post/11.JPG", ?r),
             caption: '提灯',
             equipment: 'Sony_α7ⅱ',
             location: '京都'
             )
Post.create!(user_id: 4,
             image: File.open("./db/fixtures/post/12.JPG", ?r),
             caption: '紫陽花',
             equipment: 'Sony_α7ⅱ',
             location: '京都'
             )
Post.create!(user_id: 4,
             image: File.open("./db/fixtures/post/13.JPG", ?r),
             caption: '車内',
             equipment: 'Sony_α7ⅱ',
             location: '京都'
             )
Post.create!(user_id: 5,
             image: File.open("./db/fixtures/post/14.JPG", ?r),
             caption: 'コンクリート',
             equipment: 'Sony_α7ⅱ',
             location: '京都駅'
             )
Post.create!(user_id: 5,
             image: File.open("./db/fixtures/post/15.JPG", ?r),
             caption: '象使い',
             equipment: 'Sony_α7ⅱ',
             location: 'インドネシア'
             )
Post.create!(user_id: 5,
             image: File.open("./db/fixtures/post/16.JPG", ?r),
             caption: '八坂の塔',
             equipment: 'Sony_α7ⅱ',
             location: '京都'
             )
Post.create!(user_id: 6,
             image: File.open("./db/fixtures/post/17.JPG", ?r),
             caption: '無題',
             equipment: 'Sony_α7ⅱ',
             location: '石清水八幡宮'
             )
Post.create!(user_id: 6,
             image: File.open("./db/fixtures/post/18.JPG", ?r),
             caption: 'トゥクトゥク',
             equipment: 'Sony_α7ⅱ',
             location: 'カンボジア'
             )
Post.create!(user_id: 6,
             image: File.open("./db/fixtures/post/19.JPG", ?r),
             caption: '京都',
             equipment: 'Sony_α7ⅱ',
             location: '京都'
             )
Post.create!(user_id: 7,
             image: File.open("./db/fixtures/post/20.JPG", ?r),
             caption: '夜の散歩',
             equipment: 'Sony_α7ⅱ',
             location: '京都'
             )
Post.create!(user_id: 7,
             image: File.open("./db/fixtures/post/21.JPG", ?r),
             caption: '阿蘇',
             equipment: 'Sony_α7ⅱ',
             location: '阿蘇山'
             )
Post.create!(user_id: 8,
             image: File.open("./db/fixtures/post/22.JPG", ?r),
             caption: 'ケーブル',
             equipment: 'Sony_α7ⅱ',
             location: '石清水八幡宮'
             )
Post.create!(user_id: 8,
             image: File.open("./db/fixtures/post/23.JPG", ?r),
             caption: '空',
             equipment: 'Sony_α7ⅱ',
             location: '石清水八幡宮'
             )
Post.create!(user_id: 9,
             image: File.open("./db/fixtures/post/24.JPG", ?r),
             caption: '望遠鏡',
             equipment: 'Sony_α7ⅱ',
             location: '比叡山'
             )
Post.create!(user_id: 9,
             image: File.open("./db/fixtures/post/25.JPG", ?r),
             caption: '霧のケーブル',
             equipment: 'Sony_α7ⅱ',
             location: '比叡山'
             )
Post.create!(user_id: 10,
             image: File.open("./db/fixtures/post/26.JPG", ?r),
             caption: '古代の図書館',
             equipment: 'Sony_α7ⅱ',
             location: 'アンコールワット'
             )
Post.create!(user_id: 10,
             image: File.open("./db/fixtures/post/27.JPG", ?r),
             caption: 'スチーム',
             equipment: 'Sony_α7ⅱ',
             location: '京都'
             )
Post.create!(user_id: 11,
             image: File.open("./db/fixtures/post/28.JPG", ?r),
             caption: '花火',
             equipment: 'Sony_α7ⅱ',
             location: '京都'
             )
Post.create!(user_id: 11,
             image: File.open("./db/fixtures/post/29.JPG", ?r),
             caption: '外は内、内は内',
             equipment: 'Sony_α7ⅱ',
             location: '京都'
             )
Post.create!(user_id: 12,
             image: File.open("./db/fixtures/post/30.JPG", ?r),
             caption: '平安神宮',
             equipment: 'Sony_α7ⅱ',
             location: '平安神宮'
             )
Post.create!(user_id: 12,
             image: File.open("./db/fixtures/post/31.JPG", ?r),
             caption: '夜の八阪前',
             equipment: 'Sony_α7ⅱ',
             location: '八坂神社'
             )
Post.create!(user_id: 7,
             image: File.open("./db/fixtures/post/32.JPG", ?r),
             caption: '部屋',
             equipment: 'Sony_α7ⅱ',
             location: '長崎'
             )
Post.create!(user_id: 8,
             image: File.open("./db/fixtures/post/33.JPG", ?r),
             caption: '霧の比叡山',
             equipment: 'Sony_α7ⅱ',
             location: '比叡山'
             )
Post.create!(user_id: 9,
             image: File.open("./db/fixtures/post/34.JPG", ?r),
             caption: '夏の先斗町',
             equipment: 'Sony_α7ⅱ',
             location: '先斗町'
             )
Post.create!(user_id: 10,
             image: File.open("./db/fixtures/post/35.JPG", ?r),
             caption: '花火',
             equipment: 'Sony_α7ⅱ',
             location: '京都'
             )
Post.create!(user_id: 11,
             image: File.open("./db/fixtures/post/36.JPG", ?r),
             caption: 'アンコールワットの若い僧',
             equipment: 'Sony_α7ⅱ',
             location: 'アンコールワット'
             )
Post.create!(user_id: 12,
             image: File.open("./db/fixtures/post/37.JPG", ?r),
             caption: '祇園の昼下がり',
             equipment: 'Sony_α7ⅱ',
             location: '祇園'
             )

# いいね
Like.create!(user_id: 1, post_id: 7)
Like.create!(user_id: 1, post_id: 8)
Like.create!(user_id: 1, post_id: 9)
Like.create!(user_id: 1, post_id: 10)
Like.create!(user_id: 1, post_id: 11)
Like.create!(user_id: 1, post_id: 12)
Like.create!(user_id: 3, post_id: 1)
Like.create!(user_id: 3, post_id: 2)
Like.create!(user_id: 3, post_id: 3)
Like.create!(user_id: 3, post_id: 4)
Like.create!(user_id: 3, post_id: 5)
Like.create!(user_id: 3, post_id: 6)
Like.create!(user_id: 4, post_id: 20)
Like.create!(user_id: 4, post_id: 21)
Like.create!(user_id: 4, post_id: 22)
Like.create!(user_id: 4, post_id: 23)
Like.create!(user_id: 4, post_id: 24)
Like.create!(user_id: 4, post_id: 25)
Like.create!(user_id: 5, post_id: 20)
Like.create!(user_id: 5, post_id: 21)
Like.create!(user_id: 5, post_id: 22)
Like.create!(user_id: 5, post_id: 23)
Like.create!(user_id: 5, post_id: 24)
Like.create!(user_id: 5, post_id: 25)
Like.create!(user_id: 6, post_id: 22)
Like.create!(user_id: 6, post_id: 23)
Like.create!(user_id: 6, post_id: 24)
Like.create!(user_id: 6, post_id: 25)
Like.create!(user_id: 6, post_id: 30)
Like.create!(user_id: 6, post_id: 31)
Like.create!(user_id: 7, post_id: 22)
Like.create!(user_id: 7, post_id: 23)
Like.create!(user_id: 7, post_id: 24)
Like.create!(user_id: 7, post_id: 25)
Like.create!(user_id: 7, post_id: 30)
Like.create!(user_id: 7, post_id: 31)

# お気に入り
Favorite.create!(user_id: 1, post_id: 6)
Favorite.create!(user_id: 1, post_id: 10)
Favorite.create!(user_id: 1, post_id: 15)
Favorite.create!(user_id: 1, post_id: 19)
Favorite.create!(user_id: 1, post_id: 20)
Favorite.create!(user_id: 1, post_id: 25)

# 通知
Notification.create!(visitor_id:3, visited_id:1, action: "follow")
Notification.create!(visitor_id:8, visited_id:1, action: "follow")
Notification.create!(visitor_id:10, visited_id:1, action: "follow")
Notification.create!(visitor_id:3, visited_id:1, post_id:3, action: "like")

