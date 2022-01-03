AmusementPark.destroy_all
Ride.destroy_all

six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
hurler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
hurler = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

sally = Mechanic.create!(name: "Sally Field", years_experience: 15)
martin = Mechanic.create!(name: "Martin Sheen", years_experience: 20)
andrew = Mechanic.create!(name: "Andrew Garfield", years_experience: 11)
emma = Mechanic.create!(name: "Emma Stone", years_experience: 12)

