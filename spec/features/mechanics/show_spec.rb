require 'rails_helper'

RSpec.describe 'Mechanic show page' do
  before :each do
    @greg = Mechanic.create!(name: "Greg", years_experience: 6)
    @mary = Mechanic.create!(name: "Mary", years_experience: 8)
    @jones = Mechanic.create!(name: "Jones", years_experience: 16)

    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 5, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 7, open: true)
    @wheel = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @gh = MechanicRide.create!(mechanic: @greg, ride: @hurler)
    @gs = MechanicRide.create!(mechanic: @greg, ride: @scrambler)
    @gw = MechanicRide.create!(mechanic: @greg, ride: @wheel)
    @mh = MechanicRide.create!(mechanic: @greg, ride: @hurler)
    @js = MechanicRide.create!(mechanic: @greg, ride: @scrambler)
  end

  it 'shows the name, years experience, and names of rides being worked on' do
    visit "/mechanics/#{@greg.id}"

    expect(page).to have_content(@greg.name)
    expect(page).to have_content(@greg.years_experience)
    expect(page).to have_content(@hurler.name)
    expect(page).to have_content(@scrambler.name)
    expect(page).to have_content(@wheel.name)

    expect(page).to_not have_content(@mary.name)
  end

  it 'only shows rides that are open' do
    visit "/mechanics/#{@greg.id}"

    expect(page).to have_content(@hurler)
    expect(page).to_not have_content(@wheel)
  end

  it 'lists the rides by most thrilling first and descending' do
    visit "/mechanics/#{@greg.id}"

    expect(@scrambler).to appear_before(@hurler)
  end
end
