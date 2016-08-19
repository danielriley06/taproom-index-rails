class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :brewery

  validates :ambiance, presence: true
  validates :service, presence: true
  validates :select, presence: true
  validates :food, presence: true
  validates :value, presence: true
  validates :date_visited, presence: true

end
