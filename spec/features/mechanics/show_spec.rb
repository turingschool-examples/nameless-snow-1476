require 'rails_helper'

RSpec.describe 'mechanic show page' do
  before :each do
    @mechanic_1 = Mechanic.create!(name: 'Joe', years_experience: 5)
    @mechanic_2 = Mechanic.create!(name: 'Alan', years_experience: 10)
    @mechanic_3 = Mechanic.create!(name: 'Barb', years_experience: 15)

    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: false)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 8, open: true)
    @tumbler = @six_flags.rides.create!(name: 'Tumbler', thrill_rating: 5, open: true)

    @ride_mechanic_1 = RideMechanic.create!(ride_id: @hurler.id, mechanic_id: @mechanic_1.id)
    @ride_mechanic_2 = RideMechanic.create!(ride_id: @scrambler.id, mechanic_id: @mechanic_1.id)
    @ride_mechanic_3 = RideMechanic.create!(ride_id: @ferris.id, mechanic_id: @mechanic_1.id)
    @ride_mechanic_3 = RideMechanic.create!(ride_id: @tumbler.id, mechanic_id: @mechanic_1.id)
  end

  it 'displays infro for specific mechanic' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_experience)
    expect(page).to have_content(@mechanic_1.years_experience)
  end

  it 'displays rides for that mechanic' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@hurler.name)
    expect(page).to have_content(@ferris.name)
    expect(page).to_not have_content(@scrambler.name)
  end

  it 'orders rides by thrill rating' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(@ferris.name).to appear_before(@hurler.name)
    expect(@hurler.name).to appear_before(@tumbler.name)
  end

end
