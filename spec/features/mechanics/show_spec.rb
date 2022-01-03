require 'rails_helper'
RSpec.describe 'the mechanic show page' do
  let!(:park_1) {AmusementPark.create!(name: '7 Flags', admission_cost: 50)}
  let!(:ride_1) {park_1.rides.create!(name: 'Funny Bugs', thrill_rating: 5, open:true )}
  let!(:ride_2) {park_1.rides.create!(name: 'The Wiggler', thrill_rating: 10, open:true )}
  let!(:ride_3) {park_1.rides.create!(name: 'The Squiggler', thrill_rating: 8, open:false )}
  let!(:ride_4) {park_1.rides.create!(name: 'The Jiggler', thrill_rating: 8, open:true )}
  let!(:mech_1) {ride_1.mechanics.create!(name: 'Billy Mechs', years_experience:5)}
  let!(:mech_2) {ride_1.mechanics.create!(name: 'Susy Mechs', years_experience:10)}
  let!(:ride_mech_1) {RideMechanic.create!(ride_id: ride_2.id, mechanic_id: mech_1.id)}

  it "shows a mechanic's name, years of expererience, and rides" do
    visit "/mechanics/#{mech_1.id}"
    expect(page).to have_content(mech_1.name)
    expect(page).to have_content(mech_1.years_experience)
    expect(page).to have_content(mech_1.years_experience)
    expect(page).to have_content('Funny Bugs')
    expect(page).to have_content('The Wiggler')
    expect('The Wiggler').to appear_before('Funny Bugs')
  end

  it "has a form to add a ride to a mechanic" do
    visit "/mechanics/#{mech_1.id}"
    expect(page).to have_content('Add a ride to workload')
  end

  it "can add a ride to a mech workload" do
    expect(RideMechanic.all.count).to eq(3)
    visit "/mechanics/#{mech_1.id}"
    fill_in :ride_id, with: "#{ride_4.id}"
    click_button "Submit"
    expect(current_path).to eq("/mechanics/#{mech_1.id}")
    expect(RideMechanic.all.count).to eq(4)
    expect(page).to have_content('Funny Bugs')
    expect(page).to have_content('The Wiggler')
    expect(page).to have_content('The Jiggler')
    expect(page).to have_content("#{ride_4.name}")

  end

end