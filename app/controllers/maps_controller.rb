class MapsController < AccountsController

  def brewmap
    @breweries = Brewery.all.select("latitude, longitude")
    @brewmarkers = @breweries.map do |b|
       { :lat => b.latitude, :lng => b.longitude }
    end
    @markers = @brewmarkers.to_json
  end

end
