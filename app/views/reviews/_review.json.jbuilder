json.extract! review, :id, :ambiance, :service, :selection, :food, :value, :date_visited, :description, :created_at, :updated_at
json.url review_url(review, format: :json)