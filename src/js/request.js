
 // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">


 /* ============================================================================================
   Reference: https://developers.google.com/maps/documentation/javascript/examples/places-autocomplete-directions
   ==============================================================================================
  */ 
          
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          mapTypeControl: false,
          center: {lat: 41.881832, lng: -87.623177},
          zoom: 13
        });

        new AutocompleteDirectionsHandler(map);
      }

       /**
        * @constructor
       */
      function AutocompleteDirectionsHandler(map) {
        this.map = map;
        this.originPlaceId = null;
        this.destinationPlaceId = null;
        this.travelMode = 'DRIVING';
        var originInput = document.getElementById('origin-input');
        var destinationInput = document.getElementById('destination-input');
        var submit_button = document.getElementById('button-to-submit');

        this.directionsService = new google.maps.DirectionsService;
        this.directionsDisplay = new google.maps.DirectionsRenderer;
        this.directionsDisplay.setMap(map);

        var originAutocomplete = new google.maps.places.Autocomplete(
            originInput, {placeIdOnly: true});
               var destinationAutocomplete = new google.maps.places.Autocomplete(
            destinationInput, {placeIdOnly: true});

        this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
        this.setupPlaceChangedListener(destinationAutocomplete, 'DEST');

        //this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(originInput);
        //this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(destinationInput);
        //this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(submit_button);
        /*this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(modeSelector);*/
      }

      AutocompleteDirectionsHandler.prototype.setupPlaceChangedListener = function(autocomplete, mode) {
        var me = this;
        autocomplete.bindTo('bounds', this.map);
        autocomplete.addListener('place_changed', function() {
        	var place = autocomplete.getPlace();
          if (!place.place_id) {
            window.alert("Please select an option from the dropdown list.");
            return;
          }
          if (mode === 'ORIG') {
            me.originPlaceId = place.place_id;
          } else {
            me.destinationPlaceId = place.place_id;
          }
          me.route();
        });

      }; 

      AutocompleteDirectionsHandler.prototype.route = function() {
        if (!this.originPlaceId || !this.destinationPlaceId) {
          return;
        }
        var me = this;

        this.directionsService.route({
          origin: {'placeId': this.originPlaceId},
          destination: {'placeId': this.destinationPlaceId},
          travelMode: this.travelMode
        }, function(response, status) {
          if (status === 'OK') {
            me.directionsDisplay.setDirections(response);
            origin_addr = document.getElementById('origin-input').value; //stroing Origin address
            destination_addr = document.getElementById('destination-input').value; //storing destination address
          } else {
            window.alert('Directions request failed due to ' + status);
          }
         });

      };

$(document).ready( function() {

  $( "#datepicker" ).datepicker();
  $("#button-to-submit").click(function() {

    origin_addr = $("#origin-input").val(); 
    destination_addr = $("#destination-input").val();
    datevalue = $("#datepicker").val();
    hour = $("#hour").val();
    minutes = $("#minutes").val();
    clock = $("#clock").val();
    //console.log(destination_addr);
    //console.log(hour);
    console.log(clock);
    console.log(datevalue);

            $.ajax({
              type: "POST",
              url: "../scripts/Database/save-points.php",
              data: { 
                origin_address: origin_addr,
                destination_address: destination_addr,
                leaving_date: datevalue,
                leaving_hour: hour,
                leaving_minutes: minutes,
                leaving_clock: clock
              },
        success: function(html){
          alert(html);
          window.location.href = 'listride.php?';
            }
        });
        return false;
      });
});



