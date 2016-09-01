class MapsController < AccountsController

  def brewmap
    @breweries = Brewery.search(params[:search])
    @brewmarkers = @breweries.map do |b|
       [ b.name, b.latitude, b.longitude ]
    end
    @markers = @brewmarkers.to_json
  end

end
