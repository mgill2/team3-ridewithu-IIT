// Tell jQuery to give up the dollar sign
//$.noConflict();

// jQuery 3.x-style ready event and locally scoped $
// jQuery(function($) {
//  $('html').removeClass('nojs');
 // $('html').addClass('hasjs');
//});
/*
function init(){
	var map = document.getElementById('map');
	var myLocation = new google.maps.LatLng(41.834873, -87.627006);
	var mapOptions = {
		center: myLocation,
		zoom: 10,
		mapTypeId: google.maps.MapTypeId.HYBRID,
		mapTypeControlOptions: {
			position: google.maps.ControlPosition.BOTTOM_CENTER
		}
	};

	var myMap = new google.maps.Map(map, mapOptions);

	var marker = new google.maps.Marker({
		position: myLocation,
		map: myMap,
		animation: google.maps.Animation.BOUNCE,
	});

	var contentString = '<h1>Illinois Tech</h1><p>Where IIT Students need a ride too</p>';

	var infowindow = new google.maps.InfoWindow({
      content: contentString
  	});

	google.maps.event.addListener(marker, 'click', function() {
    	infowindow.open(myMap, marker);
  	});


}
google.maps.event.addDomListener(window, 'load', init);
*/
function openNav() {
  document.getElementById("sidenavbar").style.width = "250px";
  document.getElementById("mainnavbar").style.marginLeft = "250px";
}

    function initMap() {
        //var uluru = {lat: 41.834873, lng: -87.627006};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 12,
          //center: uluru
          center: {lat: -41.834873, lng: -87.627006}
        });
        //var marker = new google.maps.Marker({
          //position: uluru,
          //map: map
        //});
        
        var infoWindow = new google.maps.InfoWindow({map: map});
        var trafficLayer = new google.maps.TrafficLayer();
        trafficLayer.setMap(map);
        
      // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
			

		 	var marker = new google.maps.Marker({
          		position: pos,
          		map: map
        	});

            infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.');
            map.setCenter(pos);
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });


        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }

      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) 
      {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.'); 
         
      }
