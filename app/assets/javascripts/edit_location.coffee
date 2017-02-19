#= require map
#= require set_location_area

$(document).ready ->
  map = googleMap()
  polygonsData = $('#map').data('polygons')

  i = 0
  while i < polygonsData.length
    polygonData = polygonsData[i]

    polygon = new (google.maps.Polygon)(
      map: map
      paths: polygonData.points_coordinates
      editable: true
    )

    points = polygon.getPath()

    google.maps.event.addListener points, 'set_at', ->
      setLocationArea(points)
    google.maps.event.addListener points, 'insert_at', ->
      setLocationArea(points)
    google.maps.event.addListener points, 'remove_at', ->
      setLocationArea(points)

    i++

  return
