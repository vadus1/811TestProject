#= require ./map

this.showPolygons = ->
  map = googleMap()
  polygonsData = $('#map').data('polygons')

  i = 0
  while i < polygonsData.length
    polygonData = polygonsData[i]

    polygon = new (google.maps.Polygon)(
      map: map
      paths: polygonData.points_coordinates
    )
    new (google.maps.InfoWindow)(
      map: map
      position: polygonData.points_coordinates[0]
      content: polygonData.name
    )

    i++

  return
