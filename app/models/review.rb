class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :brewery

  validates :ambiance, :service, :selection, :food, :value, :date_visited, presence: true
  validates :ambiance, :service, :selection, :food, :value,  :inclusion => { :in => 0..20 }


end
