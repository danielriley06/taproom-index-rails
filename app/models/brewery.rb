class Brewery < ActiveRecord::Base

  has_many :reviews
  has_many :users, through: :reviews

  def location
    [city, state].join(', ')
  end

  def self.search(search)
    Brewery.where("name LIKE ? OR city LIKE ? OR state LIKE ?", "%#{search}%","%#{search}%","%#{search}%")
  end
end
