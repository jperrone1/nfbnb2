$(document).ready(function(){

  // Initialize map centered on San Francisco: 
  function initialize() {
    var mapOptions = {
      center: new google.maps.LatLng(37.769067, -122.448500),
      zoom: 12
    };
    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    var pins = [];

    // Do AJAX call to get the search results to be mapped: 
    $.get('/accommodation_results.json', {search: {city: $("#simple_search_q").val()}}).done(function(data) {
      pins = data

      // Pan the map so that it shows the region based on the lat and lng of the first result: 
      map.panTo({ lat: pins[0].latitude, lng: pins[0].longitude });

      // Display the pins on the map: 

      $.each(pins, function(index, item){
        addPin(item.latitude, item.longitude, item.description);
      });
    });

    var addPin = function(lat, long, name){
      var loc = new google.maps.LatLng(lat, long);
      var newMarker = new google.maps.Marker({
        position: loc,
        map: map,
        title: "Accommodation"
      });

      
      // Show an info window: 
      var newInfoWindow = new google.maps.InfoWindow({
        content: "<h3> " + name + "</h3>"
      });
      addInfoWindowListener(newMarker, newInfoWindow);
    };

    var lastInfoWindow;
    var addInfoWindowListener = function(marker, newInfoWindow){
      google.maps.event.addListener(marker, 'click', function() {
        if(!!lastInfoWindow){
          lastInfoWindow.close();
        }
        if(lastInfoWindow === newInfoWindow){
          lastInfoWindow = null;
        }
        else {
          newInfoWindow.open(map,this);
          lastInfoWindow = newInfoWindow;
        }
      });
    }
  }
  google.maps.event.addDomListener(window, 'load', initialize);
});
