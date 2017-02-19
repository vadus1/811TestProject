#= require map
#= require set_location_area

$(document).ready ->
  map = googleMap()

  drawingManager = new (google.maps.drawing.DrawingManager)(
    map: map,
    drawingMode: google.maps.drawing.OverlayType.POLYGON
    drawingControl: true
    drawingControlOptions:
      position: google.maps.ControlPosition.TOP_CENTER
      drawingModes: ['polygon']
    circleOptions: editable: true
    polygonOptions: editable: true
    rectangleOptions: editable: true
  )

  google.maps.event.addListener drawingManager, 'polygoncomplete', (polygon) ->
    points = polygon.getPath()

    setLocationArea(points)
    google.maps.event.addListener points, 'set_at', ->
      setLocationArea(points)
    google.maps.event.addListener points, 'insert_at', ->
      setLocationArea(points)
    google.maps.event.addListener points, 'remove_at', ->
      setLocationArea(points)

  return
