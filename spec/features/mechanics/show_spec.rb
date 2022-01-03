require 'rails_helper'

RSpec.describe 'mechanic show page' do
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

  it 'displays a mechanics name and years of experience' do 
    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_experience)
    
    expect(page).to_not have_content(mechanic_2.name)
    expect(page).to_not have_content(mechanic_2.years_experience)
  end

  it 'displays all rides a mechanic is working on that are also open' do 
    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_4.name)

    expect(page).to_not have_content(ride_1.name)
  end

  it 'lists all open rides by thrill rating in descending order' do 
    visit "/mechanics/#{mechanic_1.id}"

    expect(ride_4.name).to appear_before(ride_2.name)
  end

  it 'displays a form to add a ride to a mechanic' do 
    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content("Add Ride To Work Load")
    expect(page).to have_button("Submit")
  end

  it 'can add a ride to a mechanics work load' do
    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to_not have_content(ride_5.name)

    fill_in(:ride_name, with: ride_5.name)
    click_button "Submit"

    expect(current_path).to eq("/mechanics/#{mechanic_1.id}")

    expect(page).to have_content(ride_5.name)

    expect(ride_4.name).to appear_before(ride_2.name)
    expect(ride_2.name).to appear_before(ride_5.name)
  end
end