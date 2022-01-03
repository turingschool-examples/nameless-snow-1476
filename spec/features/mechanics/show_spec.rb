require 'rails_helper'
RSpec.describe 'the mechanic show page' do
  let!(:park_1) {AmusementPark.create!(name: '7 Flags', admission_cost: 50)}
  let!(:ride_1) {park_1.rides.create!(name: 'Funny Bugs', thrill_rating: 5, open:true )}
  let!(:ride_2) {park_1.rides.create!(name: 'The Wiggler', thrill_rating: 10, open:true )}
  let!(:ride_3) {park_1.rides.create!(name: 'The Squiggler', thrill_rating: 8, open:false )}
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
end