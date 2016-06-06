module ProductsHelper
  def products_json(products_json)
    #byebug
    Gmaps4rails.build_markers(products_json) do |product, marker|
      marker.lat product.latitude
      marker.lng product.longitude
      marker.infowindow product.name
      # marker.picture({
      #   url:   image_path('yellow_MarkerS.png'),
      #   width: "20",
      #   height: "32"
      #  })
    end
  end
end
