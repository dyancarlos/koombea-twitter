class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :tweets, dependent: :destroy
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Relationship', dependent: :destroy
  has_many :follower_users, foreign_key: :followed_id, class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :followed_users, source: :followed
  has_many :followers, through: :follower_users, source: :follower

  validates :full_name, :username, presence: true

  def to_param
    username
  end

  def following?(user)
    following.include?(user)
  end
end
