$(function() {
	console.log("dup");
	var $joining = $('.joining');
  $.ajax({
  	url: '/trips',
  	type: 'get',
  	dataType: 'json',
  	success: function(data) {
  		data.forEach(function(trip){
		  	renderTrip(trip);
  		})
  	}
	 });
  $('#trips-ul').on('click', '.join', function(e) {
  	e.preventDefault();
  	trip_id = this.parentElement.id;
  	values = {
  		trip_id: trip_id
  	};
  	$.ajax({
  		url: '/invitations',
  		type: 'post',
  		dataType: 'json',
  		data: {
  			invitation: values
  		},
  		success: function(data) {
  			console.log(data);
  			renderTrip(data);
  		}
  	})
  })

  $('#trips-ul').on('click', '.unjoin', function(e){
  	e.preventDefault();
  	$.ajax({
  		url: '/invitations/'+$(this.parentElement).data('invitation-id'),
  		type: 'delete',
  		dataType: 'json',
  		success: function(data) {
  			
  		}
  	})
  })

  var addJoinTrip = function(){

  }
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

var renderTrip = function(trip) {
	var $oldTripLi = $('#'+trip.id);
	var $tripsUl = $('#trips-ul');
	var $newTripLi = $('<li id="' + trip.id + '"><h2>' + trip.name + '</h2></li>');
	var $newTripP = $('<p>Description: ' + trip.description + '<br/> Mountain: ' + trip.ski_location_name + '<br/>Start Date: ' + trip.start_date + '<br/> End Date: ' + trip.end_date + '</p>');
	$newTripLi.append($newTripP);
	$newTripLi.data('invitation-id', trip.invitations.id)

  if ($oldTripLi.length) {
  	$oldTripLi.replaceWith($newTripLi);
  } else {
		$tripsUl.append($newTripLi);
	}

	if(trip.invitations == null) {
		renderJoinButton($newTripLi);
	} else {
		renderUnjoinButton($newTripLi);
	}

	return $newTripLi
}

var renderJoinButton = function($ele){
	var $tripsUl = $('#trips-ul');
	var joinButton = $('<button class="join">');
	joinButton.html("JOIN EL TRIP");
	$ele.append(joinButton);
}

var renderUnjoinButton = function($ele) {
	var $tripsUl = $('#trips-ul');
	var unJoinButt = $('<button class="unjoin">');
	unJoinButt.html("Miss out on el trip");
	$ele.append(unJoinButt);
}

// have all trip info displayed on this index page with the appropriate buttons including delete and edit