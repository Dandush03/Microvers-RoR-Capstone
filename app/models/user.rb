class User < ApplicationRecord
  attr_writer :login

  # Login With Username or email
  def login
    @login || username || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value',
                                    { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end

  # update without password
  def update_with_password(params, *options)
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if params[:password].blank? || valid_password?(current_password)
               update_attributes(params, *options)
             else
               assign_attributes(params, *options)
               valid?
               errors.add(:current_password, current_password.blank? ? :blank : :invalid)
               false
             end

    clean_up_passwords
    result
  end

  # validate img upload
  def upload_is_image
    return false if cover_img =~ %r{^image/(jpeg|pjpeg|gif|png|bmp)$} || cover_img.nil?
    return false if profile_img =~ %r{^image/(jpeg|pjpeg|gif|png|bmp)$} || profile_img.nil?

    true
  end

  has_one_attached :profile_img
  has_one_attached :cover_img

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, authentication_keys: [:login]

  validate :upload_is_image
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
end
