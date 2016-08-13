class Review < ActiveRecord::Base
  has_many :associations
  has_many :users, through: :associations
  has_one :brewery, through: :associations
end
