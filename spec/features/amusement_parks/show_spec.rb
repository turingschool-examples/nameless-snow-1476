require 'rails_helper'

RSpec.describe 'amusement park show page' do
  let!(:park_1) {AmusementPark.create!(name: 'Six Flags', admission_cost: 50 )}

  let!(:ride_1) {park_1.rides.create!(name: 'The Hurler', thrill_rating: 50, open: false)}
  let!(:ride_2) {park_1.rides.create!(name: 'The Swings', thrill_rating: 90, open: true)}
  let!(:ride_3) {park_1.rides.create!(name: 'Sea Dragon', thrill_rating: 50, open: true)}
  let!(:ride_4) {park_1.rides.create!(name: 'Haunted Mansion', thrill_rating: 100, open: true)}
  let!(:ride_5) {park_1.rides.create!(name: 'Indiana Jones', thrill_rating: 80, open: true)}

  let!(:mechanic_1) {Mechanic.create!(name: "Johnny", years_experience: 10)}
  let!(:mechanic_2) {Mechanic.create!(name: "BullFrog", years_experience: 20)}

  let!(:mech_ride_1) {RideMechanic.create!(mechanic: mechanic_1, ride: ride_1)}
  let!(:mech_ride_2) {RideMechanic.create!(mechanic: mechanic_1, ride: ride_2)}
  let!(:mech_ride_3) {RideMechanic.create!(mechanic: mechanic_2, ride: ride_3)}
  let!(:mech_ride_4) {RideMechanic.create!(mechanic: mechanic_1, ride: ride_4)}

  it 'displays name and price of admission for amusement park' do 
    visit "/amusementparks/#{park_1.id}"

    expect(page).to have_content(park_1.name)
    expect(page).to have_content(park_1.admission_cost)
  end

  it 'lists all rides of the park in alphabetiocal order' do 
    visit "/amusementparks/#{park_1.id}"

    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_3.name)
    expect(page).to have_content(ride_4.name)
    expect(page).to have_content(ride_5.name)

    expect(ride_4.name).to appear_before(ride_5.name)
    expect(ride_5.name).to appear_before(ride_3.name)
    expect(ride_3.name).to appear_before(ride_1.name)
    expect(ride_1.name).to appear_before(ride_2.name)
  end

  it 'displays the average thrill rating for all rides in the park' do 
    visit "/amusementparks/#{park_1.id}"

    expect(page).to have_content("Average Thrill Rating of Rides: 74")
    save_and_open_page
  end
end