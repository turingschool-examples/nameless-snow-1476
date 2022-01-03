require 'rails_helper'

RSpec.describe 'mechanic show page' do
  before :each do
    @mechanic_1 = Mechanic.create!(name: 'Joe', years_experience: 5)
    @mechanic_2 = Mechanic.create!(name: 'Alan', years_experience: 10)
    @mechanic_3 = Mechanic.create!(name: 'Barb', years_experience: 15)

    @hurler = Ride.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = Ride.create!(name: 'The Scrambler', thrill_rating: 4, open: false)
    @ferris = Ride.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    ride_mechanic_1 = RideMechanic.create!(ride_id: @hurler_id, mechanic_id: @mechanic_1.id)
    ride_mechanic_2 = RideMechanic.create!(ride_id: @scrambler_id, mechanic_id: @mechanic_1.id)
  end

  it 'displays infro for specific mechanic' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_experience)
    expect(page).to have_content(@mechanic_1.years_experience)
  end

  it 'displays rides for that mechanic' do
    visit "/mechanics/#{@mechanic_1.id}"

  end

end
