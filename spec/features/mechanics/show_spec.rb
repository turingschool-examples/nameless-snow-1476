require 'rails_helper'

# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)

RSpec.describe 'the Mechanic show page' do
  before(:each) do
    @mech_1 = Mechanic.create!(name: 'Joe Shmoe', years_experience: 9)
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @wheel = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @mech_1.rides << @scrambler
    @mech_1.rides << @hurler
    @mech_1.rides << @wheel



    visit "/mechanics/#{@mech_1.id}"
  end

  it 'displays the mechanic name and years of experience' do
    save_and_open_page
    expect(page).to have_content(@mech_1.name)
    expect(page).to have_content(@mech_1.years_experience)
  end

  it 'displays the rides the mechanic is working on and are open' do
    expect(page).to have_content(@hurler.name)
    expect(page).to have_content(@scrambler.name)
    expect(page).to_not have_content(@wheel.name)
    expect(@hurler.name).to appear_before(@scrambler.name)
  end
end
