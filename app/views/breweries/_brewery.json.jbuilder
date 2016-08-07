json.extract! brewery, :id, :name, :city, :country, :postal_code, :state, :telephone, :type, :has_pub, :created_at, :updated_at
json.url brewery_url(brewery, format: :json)