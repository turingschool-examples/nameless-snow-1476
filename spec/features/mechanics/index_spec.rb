require 'rails_helper'
RSpec.describe 'the mechanics index page' do
  let!(:park_1) {AmusementPark.create!(name: '7 Flags', admission_cost: 50)}
  let!(:ride_1) {park_1.rides.create!(name: 'Funny Bugs', thrill_rating: 5, open:true )}
  let!(:ride_1) {park_1.rides.create!(name: 'The Wiggler', thrill_rating: 10, open:true )}
  let!(:ride_1) {park_1.rides.create!(name: 'The Squiggler', thrill_rating: 8, open:false )}
  let!(:mech_1) {Mechanic.create!(name: 'Billy Mechs', years_experience:5)}
  let!(:mech_2) {Mechanic.create!(name: 'Susy Mechs', years_experience:10)}

  it "shows a header for all mechanics" do
    visit '/mechanics'
    expect(page).to have_content('All Mechanics')
  end

  it "shows the names and years experience of all mechanics" do
    visit '/mechanics'
    expect(page).to have_content(mech_1.name)
    expect(page).to have_content(mech_1.years_experience)
    expect(page).to have_content(mech_2.name)
    expect(page).to have_content(mech_2.years_experience)
  end

  it "shows the average years experience for all mechanics" do
    visit '/mechanics'
    expect(page).to have_content('Average years of experience: 7.5')
    save_and_open_page
  end
end