class Brewery < ActiveRecord::Base

  has_many :reviews
  has_many :users, through: :reviews
  has_many :beers

  accepts_nested_attributes_for :reviews


  geocoded_by :address
  after_validation :geocode


  def address
    [street_address, city, state, postal_code].compact.join(', ')
  end

  def self.search(search)
    if search
      city = search.downcase
      where('lower(city) LIKE ? AND latitude IS NOT ?', "%#{city}%", nil)
    else
      all
    end
  end
end
