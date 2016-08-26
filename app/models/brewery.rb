class Brewery < ActiveRecord::Base

  has_many :reviews
  has_many :users, through: :reviews
  has_many :beers

  accepts_nested_attributes_for :reviews

  validates :name, :street_address, :city, :state, :postal_code, :country, :telephone, :brewery_url, :brewery_type, presence: true

  geocoded_by :address
  after_validation :geocode


  def address
    [street_address, city, state, postal_code].compact.join(', ')
  end

  def self.filter_brewery_name(search)
    Brewery.where("name LIKE ? OR city LIKE ? OR state LIKE ?", "%#{search}%","%#{search}%","%#{search}%")
  end
end
