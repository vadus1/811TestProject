module LocationHelper
  def points_coordinates(location)
    RGeo::GeoJSON.encode(location.area)['coordinates'].first.map do |coordinates|
      { lat: coordinates[0], lng: coordinates[1] }
    end
  end

  def data_for_google_map(location = nil)
    locations = (location && !location.new_record?) ? [location] : Location.all

    locations.map do |location|
      { name: location.name, points_coordinates: points_coordinates(location) }
    end.to_json
  end
end
