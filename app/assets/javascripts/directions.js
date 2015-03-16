//can't figure out how to access api key in js file
// keep getting this error: 'Access-Control-Allow-Origin' header is present on the requested resource. Origin 'http://localhost:3000' is therefore not allowed access.
function calculateRoute(from, to) {

	var myOptions = {
	  zoom: 12,
	  center: new google.maps.LatLng(40.7127136, -73.978651),
	  mapTypeId: google.maps.MapTypeId.ROADMAP
	};

	var mapObject = new google.maps.Map(document.getElementById("map-canvas"), myOptions);

	var directionsService = new google.maps.DirectionsService();

	var directionsRequest = {
	  origin: from,
	  destination: to,
	  travelMode: google.maps.DirectionsTravelMode.DRIVING,
	  unitSystem: google.maps.UnitSystem.IMPERIAL
	};

	directionsService.route(
	  directionsRequest,
	  function(response, status)
	  {
	    if (status == google.maps.DirectionsStatus.OK)
	    {
	    	debugger;
	      new google.maps.DirectionsRenderer({
	        map: mapObject,
	        directions: response
	      });
	    }
	    else
	      $("#error").append("Unable to retrieve your route<br />");
	  }
	);
}

$(function(){
	$("#origin-form").submit(function(event) {
	  event.preventDefault();
	  var origin = $('#origin').val();
		var destination = $(this).attr('destination');
	  calculateRoute(origin, destination);
	});
})
// google.maps.event.addDomListener(window, 'load', calculateRoute);

// $(function(){
// 	console.log('loaded')


// 	$('#origin-form').on('submit', function(e){
		
// 		e.preventDefault();

// 		var origin = $('#origin').val();
// 		var destination = $(this).attr('data-id');
	
// 		$.ajax({
// 			url: '/trips/' + destination,
// 			method: 'GET',
// 			dataType: 'json',
// 			success: function(data){
// 				findDirections(origin, data);
// 			}
// 		})
// 	})
// })



// function findDirections(origin, destination){
// 	var baseURL = "https://maps.googleapis.com/maps/api/directions/json?origin=";
// 	var ApiKey = "&key=AIzaSyAcPX5bMzvKRs1_Fpc9157GfAaou3Oey_4";

// //ApiKey is a placeholder for now

// 	$.ajax({
// 		url: baseURL + origin + "&destination=" + destination + "&key=" + ApiKey,
// 		dataType: 'json',
// 		success:function(data){
// 			console.log(data);
// 		}
// 	})
// }
