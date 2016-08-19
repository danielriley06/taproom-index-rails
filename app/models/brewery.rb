class Brewery < ActiveRecord::Base

  has_many :reviews
  has_many :users, through: :reviews
  has_many :beers

  accepts_nested_attributes_for :reviews

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true
  validates :telephone, presence: true
  validates :brewery_url, presence: true
  validates :brewery_type, presence: true

  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def address
    [street_address, city, state, postal_code].compact.join(', ')
  end

  def location
    [city, state].join(', ')
  end

  def self.filter_brewery_name(search)
    Brewery.where("name LIKE ? OR city LIKE ? OR state LIKE ?", "%#{search}%","%#{search}%","%#{search}%")
  end
end
