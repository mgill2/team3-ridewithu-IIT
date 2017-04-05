
 // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

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
        /*var modeSelector = document.getElementById('mode-selector');*/
        this.directionsService = new google.maps.DirectionsService;
        this.directionsDisplay = new google.maps.DirectionsRenderer;
        this.directionsDisplay.setMap(map);

        var originAutocomplete = new google.maps.places.Autocomplete(
            originInput, {placeIdOnly: true});
               var destinationAutocomplete = new google.maps.places.Autocomplete(
            destinationInput, {placeIdOnly: true});

        /*this.setupClickListener('changemode-walking', 'WALKING');
        this.setupClickListener('changemode-transit', 'TRANSIT');
        this.setupClickListener('changemode-driving', 'DRIVING');*/

        this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
        this.setupPlaceChangedListener(destinationAutocomplete, 'DEST');

        this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(originInput);
        this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(destinationInput);
        this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(submit_button);
        /*this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(modeSelector);*/
      }

      // Sets a listener on a radio button to change the filter type on Places
      // Autocomplete.
      /* AutocompleteDirectionsHandler.prototype.setupClickListener = function(id, mode) {
        var radioButton = document.getElementById(id);
        var me = this;
        radioButton.addEventListener('click', function() {
          me.travelMode = mode;
          me.route();
        });
      }; */

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
            origin_addr = document.getElementById('origin-input').value;
            //console.log(origin_addr);
            destination_addr = document.getElementById('destination-input').value;
            //console.log(destination_addr);
            //var place_id = document.getElementById('origin-input');
          } else {
            window.alert('Directions request failed due to ' + status);
          }
         });

      };

      //var submit_button = document.getElementById('button-to-submit');

      //submit_button.addEventListener('click', function() {
      	    //console.log(origin_addr);
     //function Redirect() {
        //console.log(origin_addr);
        //var data = "origin_address=" + origin_addr + "&destination_address=" + destination_addr;
        //console.log(data);
		   /*$.ajax({
        	url: "Database/save-points.php",
        	dataType: 'json',
        	type: 'GET',
        	data: {origin_address: origin_addr, destination_address: destination_addr},
        	success: function(data)
        	{                
           //check here whether inserted or not 
           alert(data.message);
        	},

          error: function(jqXHR, textStatus, errorThrown) {
          console.log(textStatus, errorThrown);
        }
   		}); */
      $("#button-to-submit").click(function() {
        var request;
        request = $.ajax ({
        url: "Database/save-points.php",
        datatype: 'json',
        type: 'GET',
        data: {origin_address: origin_addr, destination_address: destination_addr},
        });
        request.done(function(response, textStatus, jqXHR) { 
          console.log("It works!!");
          
        })

      });

