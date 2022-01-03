require 'rails_helper'

RSpec.describe 'Mechanics Show Page' do

  before(:each) do
    @amusement_park = AmusementPark.create!(name: 'Elitches', admission_cost: 90)
    @mechanic_1 = Mechanic.create!(name: 'John Doe', years_experience: 20)
    @mechanic_2 = Mechanic.create!(name: 'Sam', years_experience: 5)
    @ride_1 = Ride.create!(name: 'Roller Coaster', thrill_rating: 4, open: true, amusement_park_id: @amusement_park.id)
    @ride_2 = Ride.create!(name: 'Another Ride', thrill_rating: 2, open: false, amusement_park_id: @amusement_park.id)
    @ride_3 = Ride.create!(name: 'Brand New Ride', thrill_rating: 5, open: true, amusement_park_id: @amusement_park.id)
    MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_1.id)
    MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_2.id)
    MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_3.id)
    visit "mechanics/#{@mechanic_1.id}"
  end

  it 'displays their attributes' do
    expect(page).to have_content('Name: John Doe')
    expect(page).to have_content('Years Experience: 20')
  end

  it 'doesnt display attributes of other mechanics' do
    expect(page).to_not have_content('Name: Sam')
    expect(page).to_not have_content('Years Experience: 5')
  end

  it 'doesnt display closed rides' do
    expect(page).to_not have_content('Another Ride')
  end

  it 'displays rides they are working only if the ride is open in descending order' do
    expect(@ride_3.name).to appear_before(@ride_1.name)
  end

end
