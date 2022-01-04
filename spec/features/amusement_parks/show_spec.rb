require 'rails_helper'

RSpec.describe 'the amusement_parks show page' do
  it 'lists an amusement parks attributes and its rides' do
    amus_1 = AmusementPark.create!(name: "name_1", admission_cost: 75)
    mech_1 = Mechanic.create!(name: "Jon", years_experience: 12)
    mech_2 = Mechanic.create!(name: "James", years_experience: 14)
    mech_3 = Mechanic.create!(name: "Sam", years_experience: 9)
    mech_4 = Mechanic.create!(name: "Mike", years_experience: 11)
    ride_1 = amus_1.rides.create!(name: "ride_1", thrill_rating: 9, open: true)
    ride_2 = amus_1.rides.create!(name: "ride_2", thrill_rating: 1, open: true)
    ride_3 = amus_1.rides.create!(name: "ride_3", thrill_rating: 6, open: false)
    ride_4 = amus_1.rides.create!(name: "ride_4", thrill_rating: 3, open: true)
    ride_5 = amus_1.rides.create!(name: "ride_5", thrill_rating: 4, open: true)

    mech_1.rides << ride_1
    mech_1.rides << ride_2
    mech_1.rides << ride_3
    mech_1.rides << ride_4

    visit "/amusement_parks/#{amus_1.id}"

    expect(page).to have_content(amus_1.name)
    expect(page).to have_content(amus_1.admission_cost)

    expect(ride_1.name).to appear_before(ride_2.name)
    expect(ride_2.name).to appear_before(ride_3.name)
    expect(ride_3.name).to appear_before(ride_4.name)
    expect(ride_4.name).to appear_before(ride_5.name)

    expect(page).to have_content("Average Thrill Rating of Rides: 4.6/10")

  end
end
