AmusementPark.destroy_all
Ride.destroy_all
Mechanic.destroy_all
RideMechanic.destroy_all

six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

mech_1 = Mechanic.create(name: 'Bob', years_experience: 4)
mech_2 = Mechanic.create(name: 'Terry', years_experience: 7)

ride_mechanic_1 = RideMechanic.create(ride: hurler, mechanic: mech_1)
ride_mechanic_2 = RideMechanic.create(ride: scrambler, mechanic: mech_1)
ride_mechanic_3 = RideMechanic.create(ride: hurler, mechanic: mech_2)
