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
		url: 				'http://www.shawneemt.com/',
		category: 	'mountain',
		report_id: 	717008
	},{
		name: 			'Eagle Rock Resort',
		address: 		'1 Country Club Drive, Hazle Township, PA 18202',
		url: 				'http://www.eaglerockresort.com/leisure-activities/ski/',
		category: 	'resort',
		report_id: 	412004
	},{
		name: 			"Windham Mountain Resort",
		address: 		"14 Clarence D Lane Road,	Windham, NY, 12496",
		url: 				"http://www.windhammountain.com/",
		category: 	"resort",
		report_id:	518009
	},{
		name: 			"Okemo Mountain Resort",
		address: 		"77 Okemo Ridge Road, Ludlow, VT, 05149",
		url: 				"http://www.okemo.com/",
		category: 	"resort",
		report_id:	802013
	},{
		name: 			"Hunter Mountain",
		address: 		"64 Klein Avenue, Hunter, NY, 12442",
		url: 				"http://www.huntermtn.com/",
		category: 	"mountain",
		report_id:	518006
	},{
		name: 			"Mohawk Mountain Ski Area",
		address: 		"46 Great Hollow Road, West Cornwall, CT, 06796",
		url: 				"http://www.mohawkmtn.com",
		category: 	"mountain",
		report_id:	203001
	},{
		name: 			"Killington Mountain Resort",
		address: 		"4763 Killington Road, Killington, VT, 05751",
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
