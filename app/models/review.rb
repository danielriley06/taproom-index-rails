class Review < ActiveRecord::Base
  has_one :user
  has_one :brewery

end
