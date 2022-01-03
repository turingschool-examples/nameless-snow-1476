AmusementPark.destroy_all
Ride.destroy_all

six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
wheel = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
mind = six_flags.rides.create!(name: 'Mind Eraser', thrill_rating: 9, open: true)

jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

greg = Mechanic.create!(name: "Greg", years_experience: 6)
mary = Mechanic.create!(name: "Mary", years_experience: 8)
jones = Mechanic.create!(name: "Jones", years_experience: 16)

gh = MechanicRide.create!(mechanic: greg, ride: hurler)
gs = MechanicRide.create!(mechanic: greg, ride: scrambler)
gw = MechanicRide.create!(mechanic: greg, ride: wheel)
mh = MechanicRide.create!(mechanic: mary, ride: hurler)
js = MechanicRide.create!(mechanic: jones, ride: scrambler)
