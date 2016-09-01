class MapsController < AccountsController

  def brewmap
    @breweries = Brewery.search(params[:search])
    @brewmarkers = @breweries.map do |b|
       [ b.latitude, b.longitude, b.name, b.street_address, b.telephone, b.brewery_url ]
    end
    @markers = @brewmarkers.to_json
  end

end
