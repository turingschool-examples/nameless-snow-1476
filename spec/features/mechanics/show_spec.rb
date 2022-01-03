require 'rails_helper'

RSpec.describe 'the mechanics show page' do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'mechanic_1', years_experience: 1)

    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @ride_1 = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 4, open: true)
    @ride_2 = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 8, open: true)
    @ride_3 = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @ride_4 = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mechanic_1.id)
    RideMechanic.create!(ride_id: @ride_2.id, mechanic_id: @mechanic_1.id)
    RideMechanic.create!(ride_id: @ride_3.id, mechanic_id: @mechanic_1.id)
  end

  it 'lists mechanic info and open rides they are working on ordered by thrill rating' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_experience)
    expect(page).to have_no_content(@ride_3.name)
    expect(@ride_2.name).to appear_before(@ride_1.name)
  end

  it 'adds ride to mechanic workload' do
    visit "/mechanics/#{@mechanic_1.id}"
    fill_in 'id', with: "#{@ride_4.id}"
    click_on("Add")

    expect(page).to have_content("#{@ride_4.name}")
  end
end
