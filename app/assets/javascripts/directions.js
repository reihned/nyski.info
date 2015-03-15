//can't figure out how to access api key in js file
// keep getting this error: 'Access-Control-Allow-Origin' header is present on the requested resource. Origin 'http://localhost:3000' is therefore not allowed access.

$(function(){
	console.log('loaded')

	$('#origin-form').on('submit', function(e){
		
		e.preventDefault();

		var origin = $('#origin').val();
		var destination = $(this).attr('data-id');
	
		$.ajax({
			url: '/trips/' + destination,
			method: 'GET',
			dataType: 'json',
			success: function(data){
				findDirections(origin, data);
			}
		})
	})
})



function findDirections(origin, destination){
	var baseURL = "https://maps.googleapis.com/maps/api/directions/json?origin=";
var ApiKey = "&key=AIzaSyAcPX5bMzvKRs1_Fpc9157GfAaou3Oey_4";

//ApiKey is a placeholder for now

	$.ajax({
		url: baseURL + origin + "&destination=" + destination + "&key=" + ApiKey,
		dataType: 'json',
		success:function(data){
			console.log(data);

		}
	})

}
