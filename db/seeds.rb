# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email:'jp@nf.com', first_name:'Jeff', last_name:'Perrone', password:'12345678', password_confirmation:'12345678')

User.create(email:'gt@nf.com', first_name:'George', last_name:'Tyrebiter', password:'12345678', password_confirmation:'12345678')

Accommodation.create(price:100, description:'Beautiful views and lots of sun.', listing_type:'Private room', locale:'Glen Park', city:'San Francisco', address1:'145 Moreland Street', address2:'', state:'CA', zip:'94131', phone:'(415)555-1212', user_id: 1, latitude: 37.739300, longitude: -122.434999)

Accommodation.create(price:500, description:'Nice location.', listing_type:'Entire home/apt.', locale:'Miraloma Park', city:'San Francisco', address1:'33 Miraloma Drive', address2:'', state:'CA', zip:'94127', phone:'(415)555-1212', user_id: 1, latitude: 37.739530, longitude: -122.459744) 

Accommodation.create(price:150, description:'Beautiful rural area.', listing_type:'Shared room', locale:'', city:'Old Westbury', address1:'6 Pine Tree Lane', address2:'', state:'NY', zip:'11568', phone:'(516)555-1212', user_id: 1, latitude: 40.794945, longitude: -73.595194)

Accommodation.create(price:400, description:'Funky house near City College', listing_type:'Entire home/apt.', locale:'Ingleside', city:'San Francisco', address1:'1143 Capitol Avenue', address2:'', state:'CA', zip:'94112', phone:'(415)555-1212', user_id: 2, latitude: 37.722654, longitude: -122.459521)