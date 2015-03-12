# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create({
	email: 'admin@nyski.club',
	password: 'trippingdonkeys',
	admin: true
	})

funny = User.create({
	email: 'jon@cray.edu',
	password: 'what',
	admin: false
	})

ski_location = Ski_location.create({
	name: 'Mountain of Awesomeness',
	address: 'Your Mom',
	url: 'www.awesome.com',
	longitude: '123',
	latitude: '321',
	category: 'mountain'
	})

trip = Trip.create({
	start_date: '2/2/1985',
	end_date: '2/4/1985',
	status: 'pending',
	user_id: 1,
	name: 'Fantastic Trip',
	description: 'Totally awesome!',
	ski_location_id: ski_location.id
	})
