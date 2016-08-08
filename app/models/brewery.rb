class Brewery < ActiveRecord::Base
  include Filterable
  
  has_many :reviews
  has_many :users, through: :reviews

  scope :location, -> (location) { where location: location }
  scope :starts_with, -> (name) { where("name like ?", "#{name}%")}

  def location
    [city, state].join(', ')
  end
end
