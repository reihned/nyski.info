# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Trip.delete_all
SkiLocation.delete_all
Invitation.delete_all

admin = User.create({
	name: 'jane doe',
	email: 'admin@nyski.club',
	password: 'trippingdonkeys',
	admin: true
	})

funny = User.create({
	name: 'john doe',
	email: 'jon@cray.edu',
	password: 'what',
	admin: false
	})

locations = SkiLocation.create([
	{
		name: 			'Shawnee Mountain Ski Area',
		address: 		'401 Hollow Rd East Stroudsburg, PA, 18301',
		description:"Shawnee Mountain Ski Area is the Poconos' Favorite Family Ski Resort. 23 slopes & trails, 2 terrain parks, night skiing and snow tubing.",
		url: 				'http://www.shawneemt.com/',
		category: 	'mountain',
		report_id: 	717008
	},{
		name: 			'Eagle Rock Resort',
		address: 		'1 Country Club Drive, Hazle Township, PA 18202',
		description:"Eagle Rock Resort offers snow sports for all ages and abilities. Set amongst the beautiful Blue Mountain range, Eagle Rock offers skiing,  snow boarding, snow tubing and more!",
		url: 				'http://www.eaglerockresort.com/leisure-activities/ski/',
		category: 	'resort',
		report_id: 	412004
	},{
		name: 			"Windham Mountain Resort",
		address: 		"14 Clarence D Lane Road,	Windham, NY, 12496",
		url: 				"http://www.windhammountain.com/",
		description:"New York's premier ski resort, Windham is known for its convenient location, family-friendly atmosphere and customer service.",
		category: 	"resort",
		report_id:	518009
	},{
		name: 			"Okemo Mountain Resort",
		address: 		"77 Okemo Ridge Road, Ludlow, VT, 05149",
		url: 				"http://www.okemo.com/",
		description:"With its 96% snowmaking coverage, Okemo has received top rankings for its snow quality. Located in scenic Vermont, they offer perks like family pricing and sensible resort layout.",
		category: 	"resort",
		report_id:	802013
	},{
		name: 			"Hunter Mountain",
		address: 		"64 Klein Avenue, Hunter, NY, 12442",
		description:"Three separate mountains with a wide variety of terrain catering for beginner, intermediate and expert skiers. Wide, spacious learning spaces for beginners and steeps and bumps for the expert -- there's something for everyone!",
		url: 				"http://www.huntermtn.com/",
		category: 	"mountain",
		report_id:	518006
	},{
		name: 			"Mohawk Mountain Ski Area",
		address: 		"46 Great Hollow Road, West Cornwall, CT, 06796",
		url: 				"http://www.mohawkmtn.com",
		description:"Only two hours from NYC, this resort offers great snow (real and homemade), well marked trails for beginners and more challenging trails for experts, as well as an excellent ski school for children with extensive programming.",
		category: 	"mountain",
		report_id:	203001
	},{
		name: 			"Killington Mountain Resort",
		address: 		"4763 Killington Road, Killington, VT, 05751",
		description:"Killington is known for its diverse terrain and groomed slopes. Enjoy a wide variety of choice -- wide-open runs, narrow classic New England slopes, moguls, steeps and gladed skiing areas. Snowboarders and freeskiers can take advantage of Killington's varied terrain, including Bear Mountain’s signature terrain parks.",
		url: 				"http://www.killington.com/",
		category: 	"resort",
		report_id:	802007
	}
])

trips = Trip.create([
	{
		start_date: 			'2/2/1985',
		end_date: 				'2/4/1985',
		status: 					0,
		creator_id: 			admin.id,
		name: 						'Fantastic Trip',
		description: 			'Totally awesome!',
		ski_location_id: 	locations[0].id
	},
	{
		start_date: '4/10/2014',
		end_date: '5/4/2014',
		status: 0,
		creator_id: funny.id,
		name: 'Baller tripping',
		description: "We're going on a sweet trip to hit every mountain in the world. but first and foremost ",
		ski_location_id: locations[1].id
	}
])

invitations = Invitation.create([
	{
		user_id: funny.id,
		trip_id: trips[0].id,
		rsvp: false,
		email: funny.email
	} , {
		user_id: admin.id,
		trip_id: trips[1].id,
		rsvp: true,
		email: admin.email
	}
])
