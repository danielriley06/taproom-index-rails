class Brewery < ActiveRecord::Base

  has_many :reviews
  has_many :beers

  def location
    [city, state].join(', ')
  end

  def self.filter_brewery_name(search)
    Brewery.where("name LIKE ? OR city LIKE ? OR state LIKE ?", "%#{search}%","%#{search}%","%#{search}%")
  end
end
