require 'rails_helper'

RSpec.describe 'mechanics show page' do
  it 'lists the specific mechanic and their rides in order of thrill and open' do
    mech_1 = Mechanic.create!(name: 'Tom', years_experience: 5)
    amusement_park = AmusementPark.create!(name: 'Lakeside', admission_cost: 2)
    ride_1 = amusement_park.rides.create!(name: 'hurricane', thrill_rating: 5, open: true)
    ride_2 = amusement_park.rides.create!(name: 'cyclone', thrill_rating: 7, open: true)
    ride_3 = amusement_park.rides.create!(name: 'bumper cars', thrill_rating: 2, open: true)
    ride_4 = amusement_park.rides.create!(name: 'matterhorn', thrill_rating: 10, open: false)
    mech_1.rides << ride_1
    mech_1.rides << ride_2
    mech_1.rides << ride_3
    mech_1.rides << ride_4

    visit "/mechanics/#{mech_1.id}"
    within '.mechanic' do
      expect(page).to have_content("Name: #{mech_1.name}, years of experience: #{mech_1.years_experience}")
    end
    first_ride = find(".ride-#{ride_2.id}")
    second_ride = find(".ride-#{ride_1.id}")
    third_ride = find(".ride-#{ride_3.id}")
    expect(first_ride).to appear_before(second_ride)
    expect(second_ride).to appear_before(third_ride)
    expect(third_ride).to_not appear_before(second_ride)
    expect(page).to_not have_content(ride_4.name)
  end
  it 'lists the specific mechanic and their rides in order of thrill and open' do
    mech_1 = Mechanic.create!(name: 'Tom', years_experience: 5)
    amusement_park = AmusementPark.create!(name: 'Lakeside', admission_cost: 2)
    ride_1 = amusement_park.rides.create!(name: 'hurricane', thrill_rating: 5, open: true)
    ride_2 = amusement_park.rides.create!(name: 'cyclone', thrill_rating: 7, open: true)
    ride_3 = amusement_park.rides.create!(name: 'bumper cars', thrill_rating: 2, open: true)
    ride_4 = amusement_park.rides.create!(name: 'matterhorn', thrill_rating: 10, open: true)
    mech_1.rides << ride_1
    mech_1.rides << ride_2
    mech_1.rides << ride_3

    visit "/mechanics/#{mech_1.id}"
    within '.add-ride-form' do
      expect(page).to have_content('Add a ride to workload')
      fill_in 'ride_id', with: ride_4.id
      click_on('Submit')
    end
    expect(current_path).to eq("/mechanics/#{mech_1.id}")
    expect(page).to have_content(ride_4.name)
  end
end
