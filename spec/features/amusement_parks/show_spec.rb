require 'rails_helper'

RSpec.describe 'Amusement Park Show Page' do

  before(:each) do
    @amusement_park = AmusementPark.create!(name: 'Elitches', admission_cost: 90)
    @ride_1 = Ride.create!(name: 'Roller Coaster', thrill_rating: 4, open: true, amusement_park_id: @amusement_park.id)
    @ride_2 = Ride.create!(name: 'Another Ride', thrill_rating: 2, open: false, amusement_park_id: @amusement_park.id)
    @ride_3 = Ride.create!(name: 'Brand New Ride', thrill_rating: 5, open: true, amusement_park_id: @amusement_park.id)
    visit "amusement_parks/#{@amusement_park.id}"
  end

  it 'displays the amusement parks admission cost and name' do
    expect(page).to have_content("Admissions: $90")
    expect(page).to have_content("Elitches")
  end

  it 'displays the amusement parks rides in alphabetical order' do
    expect(page).to have_content("Another Ride\nBrand New Ride\nRoller Coaster")
  end

  it 'displays the average thrill rating of the  amusement parks rides' do
    expect(page).to have_content("Average Thrill Rating of Rides: 3.67/10")
  end

end
