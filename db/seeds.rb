Ride.destroy_all
AmusementPark.destroy_all
Mechanic.destroy_all


six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

ride1 = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
ride2 = six_flags.rides.create!(name: 'The Curler', thrill_rating: 4, open: true)
ride3 = six_flags.rides.create!(name: 'The Twirler', thrill_rating: 7, open: false)

jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

mechanic1 = Mechanic.create(name: 'Kara Smith', years_experience: 20)
mechanic2 = Mechanic.create(name: 'Sam Jones', years_experience: 10)
mechanic3 = Mechanic.create(name: 'Jim Anderson', years_experience: 15)