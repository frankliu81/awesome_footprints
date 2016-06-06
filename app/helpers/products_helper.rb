module ProductsHelper
  def products_json(products_json)
    #byebug
    Gmaps4rails.build_markers(products_json) do |product, marker|      
      marker.lat product.latitude
      marker.lng product.longitude
      marker.infowindow product.name
    end
  end
end
