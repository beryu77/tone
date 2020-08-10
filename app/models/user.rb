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
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
                   foreign_key: "follower_id",
                   dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                   foreign_key: "followed_id",
                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  # 仮想の属性（トークンをデータベースに保存せずに実装するため）
  attr_accessor :remember_token

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def User.new_token
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

  # ユーザーをフォローする
  def follow(other_user)
    unless self == other_user
      self.active_relationships.find_or_create_by(followed_id: other_user.id)
    end
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    relationship = self.active_relationships.find_by(followed_id: other_user.id)
    relationship.destroy if relationship
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    self.following.include?(other_user)
  end

  # 投稿にいいねする
  def like(post)
    self.likes.find_or_create_by(post_id: post.id)
  end

  # 投稿のいいねを解除する
  def unlike(post)
    self.likes.find_by(post_id: post.id).destroy
  end

  # 現在のユーザーがいいねしてたらtrueを返す
  def like?(post)
    self.liked_posts.include?(post)
  end

  # ユーザーのフィードを返す
  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Post.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end
end
