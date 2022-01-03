AmusementPark.destroy_all
Ride.destroy_all
Mechanic.destroy_all

universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
@mech_1 = Mechanic.create!(name: "Joe Shmoe", years_experience: 9)
@mech_2 = Mechanic.create!(name: "Jon Smith", years_experience: 20)
@mech_2 = Mechanic.create!(name: "Jane Shmoe", years_experience: 16)

@six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

@scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
@hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
@wheel = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 6, open: false)
@dump = @six_flags.rides.create!(name: 'The Dump', thrill_rating: 7, open: true)


@mech_1.rides << @scrambler
@mech_1.rides << @hurler
@mech_1.rides << @wheel

jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
