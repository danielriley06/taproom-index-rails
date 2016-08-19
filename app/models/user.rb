class User < ActiveRecord::Base

  has_many :reviews
  has_many :breweries, through: :reviews

  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  validates :username, presence: true, unless: -> { from_omniauth? }
  validates :email, format: { with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i }, unless: -> { from_omniauth? }
  validates :password, confirmation: true, unless: -> { from_omniauth? }
  validates :password, presence: true, length: {minimum: 5, maximum: 120}, on: :create, unless: -> { from_omniauth? }
  validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true, unless: -> { from_omniauth? }

  def update_password_with_password(params, *options)
    current_password = params.delete(:current_password)

    result = if valid_password?(current_password)
               update_attributes(params, *options)
             else
               self.assign_attributes(params, *options)
               self.valid?
               self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
               false
             end

    clean_up_passwords
    result
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    #Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(name: data["name"],
           email: data["email"],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end

  private
  
  def from_omniauth?
    provider && uid
  end
end
