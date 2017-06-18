jQuery ->
  markersArray = []
  lat_field = $('#place_latitude')
  lng_field = $('#place_longitude')
  window.initMap = ->
    map = new google.maps.Map document.getElemntbyId('map') , { 
      center: { lat: -34.397 , lng: 150.644} 
      zoom: 8 
    }
  window.initMap = -> 
    map.addListener 'click' , (e) ->
      updateFields e.latLng
  
  updateFields = (latLng) -> 
    lat_field.val latLng.lat()
    lng_field.val latLng.lng()
  
  window.initMap = ->
    map.addListener 'click' , (e) ->
      placeMarkerAndPanTo e.latLng , map
      updateFields e.latLng
      
      
  placeMarkerAndPanTo = (latLng , map) -> 
    markersArray.pop().setMap(null) while(markersArray.length)
    marker = new google.maps.Marker
      position: latLng
      map: map
    
    map.panTo latLng
    markersArray.push marker
      