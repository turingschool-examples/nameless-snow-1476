require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  it 'lists all rides at a amusement park in alphabetical order' do
    amus_1 = AmusementPark.create!(name: "name_1", admission_cost: 75)
    mech_1 = Mechanic.create!(name: "Jon", years_experience: 12)
    mech_2 = Mechanic.create!(name: "James", years_experience: 14)
    mech_3 = Mechanic.create!(name: "Sam", years_experience: 9)
    mech_4 = Mechanic.create!(name: "Mike", years_experience: 11)
    ride_1 = amus_1.rides.create!(name: "a ride_1", thrill_rating: 9, open: true)
    ride_2 = amus_1.rides.create!(name: "b ride_2", thrill_rating: 1, open: true)
    ride_3 = amus_1.rides.create!(name: "c ride_3", thrill_rating: 6, open: false)
    ride_4 = amus_1.rides.create!(name: "d ride_4", thrill_rating: 3, open: true)
    ride_5 = amus_1.rides.create!(name: "e ride_5", thrill_rating: 4, open: true)


    expect(amus_1.rides_order).to eq([ride_1, ride_2, ride_3, ride_4, ride_5])
  end

  it 'shows an amusement_parks average thrill rating of rides' do
    amus_1 = AmusementPark.create!(name: "name_1", admission_cost: 75)
    mech_1 = Mechanic.create!(name: "Jon", years_experience: 12)
    mech_2 = Mechanic.create!(name: "James", years_experience: 14)
    mech_3 = Mechanic.create!(name: "Sam", years_experience: 9)
    mech_4 = Mechanic.create!(name: "Mike", years_experience: 11)
    ride_1 = amus_1.rides.create!(name: "a ride_1", thrill_rating: 9, open: true)
    ride_2 = amus_1.rides.create!(name: "b ride_2", thrill_rating: 1, open: true)
    ride_3 = amus_1.rides.create!(name: "c ride_3", thrill_rating: 6, open: false)
    ride_4 = amus_1.rides.create!(name: "d ride_4", thrill_rating: 3, open: true)
    ride_5 = amus_1.rides.create!(name: "e ride_5", thrill_rating: 4, open: true)



    expect(amus_1.thrill_fract).to eq(4.6)
  end
end
