class MapsController < AccountsController

  def brewmap
    @breweries = Brewery.search(params[:search])
    @brewmarkers = @breweries.map do |b|
       { :lat => b.latitude, :lng => b.longitude }
    end
    @markers = @brewmarkers.to_json
  end

end
