this.setLocationArea = (points) ->
  numberOfPoints = points.getLength()
  pointLocationsInString = ''

  i = 0
  while i < numberOfPoints
    point = points.getAt(i)

    pointLocationsInString += point.lat() + ' ' + point.lng()
    pointLocationsInString += ', ' if (i + 1) != numberOfPoints

    i++

  $('#location_area').attr('value', 'POLYGON((' + pointLocationsInString + '))')

  return
