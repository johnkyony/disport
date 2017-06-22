jQuery ->
  markersArray = []
  lat_field = $('#place_latitude')
  lng_field = $('#place_longitude')
  window.initMap = ->
    map = new google.maps.Map document.getElemntbyId('map') , { 
      center: { lat: -34.397 , lng: 150.644} 
      zoom: 8 
      mapTypeId: 'terrain'
    }
    console.log('this is working')
  window.initMap = -> 
    map.addListener 'click' , (e) ->
      updateFields e.latLng
    console.log('i am working')
  
  updateFields = (latLng) -> 
    lat_field.val latLng.lat()
    lng_field.val latLng.lng()
    console.log('i am working')
  
  window.initMap = ->
    map.addListener 'click' , (e) ->
      placeMarkerAndPanTo e.latLng , map
      updateFields e.latLng
    console.log('i am working')
      
      
  placeMarkerAndPanTo = (latLng , map) -> 
    markersArray.pop().setMap(null) while(markersArray.length)
    marker = new google.maps.Marker
      position: latLng
      map: map
    
    map.panTo latLng
    markersArray.push marker
    console.log('i am working')
  
  
  window.initMap = -> 
    $('#find-on-map').click(e) -> 
      e.preventDefault()
      console.log('i am working')
      placeMarkerAndPanTo {
        lat: parseInt lat_field.val() , 10 
        lng: parseInt lng_field.val() , 10
      } , map
    
      