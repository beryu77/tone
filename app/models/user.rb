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
class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  has_many :comment_likes
  has_many :comment_post, through: :comment_likes, source: :post

  has_many :contests, dependent: :destroy
  has_many :contest_posts

  has_many :active_notifications, class_name: 'Notification',
                                  foreign_key: 'visitor_id',
                                  dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification',
                                   foreign_key: 'visited_id',
                                   dependent: :destroy

  # 仮想の属性（トークンをデータベースに保存せずに実装するため）
  attr_accessor :remember_token

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 10 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
  validates :profile, length: { maximum: 150 }

  # 渡された文字列のハッシュ値を返す
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?

    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end

  # フォローしているか確認する
  def following?(user)
    active_relationships.find_by(followed_id: user.id)
  end

  # フォローする
  def follow(user)
    active_relationships.create!(followed_id: user.id)
  end

  # フォローを外す
  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end

  # いいねしているか確認する
  def already_liked?(post)
    likes.exists?(post_id: post.id)
  end

  # お気に入りの投稿として保存しているか確認する
  def already_made_favorite?(post)
    favorites.exists?(post_id: post.id)
  end

  # 表示している投稿がベストフォトとして保存されているか確認する
  def saved_this_best?(post)
    best_photos.exists?(user_id: id, post_id: post.id)
  end

  # コメントにいいねしているか確認する
  def comment_liked?(comment)
    comment_likes.exists?(comment_id: comment.id)
  end

  # ユーザーのフィードを返す
  def timeline
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Post.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

  # フォロー通知の作成
  def create_notification_follow(current_user)
    temp = Notification.where(['visitor_id = ? and visited_id = ? and action = ? ', current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end
