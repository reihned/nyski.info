$(function() {
	console.log("dup");
	// renderJoinButton();
	var $joining = $('#joining');
  $.ajax({
  	url: '/trips',
  	type: 'get',
  	dataType: 'json',
  	success: function(data) {
  		data.forEach(function(trip){
  			var button = $("<button>");
  			button.html("JOIN EL TRIP");
  			$joining.append(button);
  		})
  	}
	 });
	// $('#joining').on('click', '.joinButton', function(e) {
	// 	e.preventDefault();
	// 	console.log("look at me! im mr meseeks!")
	// 	var trip_id = this.id;
	// 	var values = {
	// 		trip_id: trip_id,
	// 	};

	//   $.ajax({
	//     url: '/invitations',
	//     method: 'POST',
	//     dataType: 'json',
	//     data: { invitation: values },
	//     success: function(data){
	//     	console.log(data);
	//     }
	//   })
	// })
});

var renderJoinButton = function(){
	var $joining = $('#joining');
	var btn = document.createElement("BUTTON");
	var t = document.createTextNode("JOINing");
	btn.appendChild(t);
	$joining.append(btn);
}


// have all trip info displayed on this index page with the appropriate buttons including delete and edit