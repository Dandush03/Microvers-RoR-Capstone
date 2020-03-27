class User < ApplicationRecord
  attr_writer :login

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, authentication_keys: [:login]

  validates :full_name, presence: true, length: { maximum: 30 }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 15 }
  # Cultures
  has_many :cultures
  # Followers
  has_many :followers, class_name: 'Following', foreign_key: 'follower_id'
  has_many :current_followers, through: :followers
  # Followeds
  has_many :followeds, class_name: 'Following', foreign_key: 'followed_id'
  has_many :current_followeds, through: :followeds

  # Login With Username or email
  def login
    @login || self.username || self.email
  end
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

end
