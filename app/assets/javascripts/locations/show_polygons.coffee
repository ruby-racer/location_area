#= require ./map

this.showPolygons = ->
  google.maps.Polygon::getBoundingBox = ->
    bounds = new (google.maps.LatLngBounds)
    @getPath().forEach (element, index) ->
      bounds.extend element
    bounds

  map = googleMap()
  polygonsData = $('#map').data('polygons')

  i = 0
  while i < polygonsData.length
    polygonData = polygonsData[i]
    console.log(polygonData)
    console.log(polygonData.points_coordinates)

    polygon = new (google.maps.Polygon)(
      map: map
      paths: polygonData.points_coordinates
    )
    new (google.maps.InfoWindow)(
      map: map
      position: polygon.getBoundingBox().getCenter()
      content: polygonData.name
    )

    i++

  return
