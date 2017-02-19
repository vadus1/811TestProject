this.googleMap = ->
  new (google.maps.Map)(
    document.getElementById('map'),
    zoom: 2
    center:
      lat: 45
      lng: 0
  )
