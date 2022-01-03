require 'rails_helper'
RSpec.describe 'the amusement park show page' do
  let!(:park_1) {AmusementPark.create!(name: '7 Flags', admission_cost: 50)}
  let!(:ride_1) {park_1.rides.create!(name: 'Funny Bugs', thrill_rating: 5, open:true )}
  let!(:ride_2) {park_1.rides.create!(name: 'The Wiggler', thrill_rating: 10, open:true )}
  let!(:ride_3) {park_1.rides.create!(name: 'The Squiggler', thrill_rating: 8, open:false )}
  let!(:mech_1) {ride_1.mechanics.create!(name: 'Billy Mechs', years_experience:5)}
  let!(:mech_2) {ride_1.mechanics.create!(name: 'Susy Mechs', years_experience:10)}

  it "shows name and price of admissions for the park" do
    visit "/parks/#{park_1.id}"
    expect(page).to have_content(park_1.name)
    expect(page).to have_content(park_1.admission_cost)
  end

  it "show all rides from highest thrill to lowest" do
    visit "/parks/#{park_1.id}"
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_3.name)
    expect(ride_2.name).to appear_before(ride_1.name)
    expect(ride_2.name).to appear_before(ride_3.name)
    expect(ride_3.name).to appear_before(ride_1.name)
  end

  it "shows the average thrill rating of all rides" do
    visit "/parks/#{park_1.id}"
    expect(page).to have_content('Average Thrill: 7.7/10')
    save_and_open_page
  end
end