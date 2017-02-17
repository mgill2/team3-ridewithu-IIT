// Tell jQuery to give up the dollar sign
$.noConflict();

// jQuery 3.x-style ready event and locally scoped $
jQuery(function($) {
  $('html').removeClass('nojs');
  $('html').addClass('hasjs');
});

function init(){
	var el = document.getElementById('canvas');
	var myLocation = new google.maps.LatLng(26.14173, -81.79919);
	var mapOptions = {
		center: myLocation,
		zoom: 10,
		mapTypeId: google.maps.MapTypeId.HYBRID,
		mapTypeControlOptions: {
			position: google.maps.ControlPosition.BOTTOM_CENTER
		}
	};

	var myMap = new google.maps.Map(el, mapOptions);

	var marker = new google.maps.Marker({
		position: myLocation,
		map: myMap,
		animation: google.maps.Animation.BOUNCE,
		icon: 'lure.png'
	});

	var contentString = '<h1>Gulf of Mexico</h1><p>Place to catch saltwater fish :)</p>';

	var infowindow = new google.maps.InfoWindow({
      content: contentString
  	});

	google.maps.event.addListener(marker, 'click', function() {
    	infowindow.open(myMap, marker);
  	});


}

google.maps.event.addDomListener(window, 'load', init);