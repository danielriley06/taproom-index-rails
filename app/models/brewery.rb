class Brewery < ActiveRecord::Base

  has_many :associations
  has_many :users, through: :associations
  has_many :reviews, through: :associations

  def location
    [city, state].join(', ')
  end

  def self.filter_brewery_name(search)
    Brewery.where("name LIKE ? OR city LIKE ? OR state LIKE ?", "%#{search}%","%#{search}%","%#{search}%")
  end
end
