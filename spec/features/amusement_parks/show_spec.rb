require 'rails_helper'

RSpec.describe 'Amusement Parks show page' do
  let!(:six_flags){AmusementPark.create!(name: 'Six Flags', admission_cost: 75)}

  let!(:hurler){six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)}
  let!(:scrambler){six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)}
  let!(:ferris){six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)}
  let!(:superman){six_flags.rides.create!(name: 'Superman', thrill_rating: 10, open: true)}

  it "shows the name, price, and the rides within that park sorted alphabetically" do
    visit "/amusement_parks/#{six_flags.id}"

    expect(page).to have_content(six_flags.name)
    expect(page).to have_content(six_flags.admission_cost)
    expect(page).to have_content("Rides:")
    expect(ferris.name).to appear_before(superman.name)
  end
  it "shows the average thrill rating of the rides" do
    visit "/amusement_parks/#{six_flags.id}"

    expect(page).to have_content("Average Thrill")
    expect(page).to have_content("7")
  end
end
