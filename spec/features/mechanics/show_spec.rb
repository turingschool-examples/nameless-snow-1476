require 'rails_helper'

RSpec.describe 'Mechanics Show Page' do
  before(:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @mechanic_1 = Mechanic.create!(name: "Robin", years_experience: 12)
    @ride_1 = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @ride_2 = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ride_3 = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 10, open: true)
    @mechanic_ride_1 = @mechanic_1.mechanic_rides.create!(ride_id: @ride_1.id)
    @mechanic_ride_2 = @mechanic_1.mechanic_rides.create!(ride_id: @ride_2.id)
    @mechanic_ride_3 = @mechanic_1.mechanic_rides.create!(ride_id: @ride_3.id)
  end

  it 'displays their info and rides that they are working on' do

    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_experience)
    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_2.name)
    expect(page).to have_content(@ride_3.name)
  end

  it 'only displays rides that are open' do
    ride_4 = @six_flags.rides.create!(name: 'The Closed Ride', thrill_rating: 1, open: false)
    mechanic_ride_4 = @mechanic_1.mechanic_rides.create!(ride_id: ride_4.id)

    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_2.name)
    expect(page).to have_content(@ride_3.name)
    expect(page).to_not have_content(ride_4.name)
  end

  it 'lists rides in descending order' do
    visit "/mechanics/#{@mechanic_1.id}"
    
    expect(@ride_3.name).to appear_before(@ride_1.name)
    expect(@ride_1.name).to appear_before(@ride_2.name)
  end
end
