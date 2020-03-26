class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, presence: true, length: { maximum: 30 }

  # Cultures
  has_many :cultures
  # Followers
  has_many :followers, class_name: 'Following', foreign_key: 'follower_id'
  has_many :current_followers, through: :followers
  # Followeds
  has_many :followeds, class_name: 'Following', foreign_key: 'followed_id'
  has_many :current_followeds, through: :followeds
end
