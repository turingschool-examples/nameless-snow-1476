AmusementPark.destroy_all
Ride.destroy_all

six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
hurler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
hurler = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: true)

jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

mechanic_1 = Mechanic.create!(name: "Robin", years_experience: 12)
mechanic_2 = Mechanic.create!(name: "Daisy", years_experience: 20)
mechanic_3 = Mechanic.create!(name: "Richard", years_experience: 4)

ride_1 = mechanic_1.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
ride_2 = mechanic_1.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
ride_3 = mechanic_1.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: true)
