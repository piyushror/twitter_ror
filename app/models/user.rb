class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :followings, class_name: "Follow", foreign_key: :following_id
  has_many :following_users, class_name: "User", through: :followings,  source: :following
  has_many :followers, class_name: "Follow", foreign_key: :follower_id
  has_many :follower_users, class_name: "User", through: :followers, source: :follower
end
