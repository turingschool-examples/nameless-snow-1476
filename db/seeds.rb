AmusementPark.destroy_all
Ride.destroy_all

six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
ferris_sheel = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)


kennywood = AmusementPark.create!(name:"Kennywood", admission_cost:25)

bob = Mechanic.create!(name:"Bob O'Malley", years_experience:15)
kiersten = Mechanic.create!(name:"Kiersten Singer", years_experience:8)
sally = Mechanic.create!(name:"Sally Smith", years_experience:20)

phantom = kennywood.rides.create!(name:"Steel Phantom", thrill_rating:8, open: true)
jack_rabbit = kennywood.rides.create!(name:"Jack Rabbit", thrill_rating:5, open: false)
thunderbolt = kennywood.rides.create!(name:"Thunderbolt", thrill_rating:6, open: true)
racer = kennywood.rides.create!(name:"Racer", thrill_rating:6, open: true)
phantoms_revenge = kennywood.rides.create!(name:"Phantom's Revenge", thrill_rating:9, open: true)
steel_curtain = kennywood.rides.create!(name:"Steel Curtain", thrill_rating:9, open: true)

sally.rides << phantom 
sally.rides << jack_rabbit
sally.rides << thunderbolt

bob.rides << phantoms_revenge

kiersten.rides << racer
