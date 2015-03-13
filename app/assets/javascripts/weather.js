function getResults(query) {
	var baseURL = "http://api.wunderground.com/api/";
	var APIKey = "6655bf1b70934715";
	var fullQuery = APIKey + query;


	$(document).ready(function($) {
	  $.ajax({
	  url: baseURL + fullQuery;
	  "http://api.wunderground.com/api/6655bf1b70934715/geolookup/forecast/q/IA/Cedar_Rapids.json",
	  dataType: "jsonp",
	  success: function(parsed_json) {
		  var location = parsed_json['location']['city'];
		  var temp_f = parsed_json['current_observation']['temp_f'];
		  alert("Current temperature in " + location + " is: " + temp_f);
	  }
	  });
	});
}


function renderResults() {
	
}