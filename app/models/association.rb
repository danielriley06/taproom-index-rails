class Association < ActiveRecord::Base
   #columns id | user_id | brewery_id | review_id | visited_date | created_at | updated_at
   belongs_to :user
   belongs_to :brewery
   belongs_to :review
end
