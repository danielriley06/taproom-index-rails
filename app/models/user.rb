class User < ActiveRecord::Base
  enum role: [:user, :admin]

  has_many :associations
  has_many :breweries, through: :associations
  has_many :reviews, through: :associations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
