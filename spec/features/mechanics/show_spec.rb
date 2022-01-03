require 'rails_helper'

# As a user,
# When I go to a mechanics show page
# I see a form to add a ride to their workload
# When I fill in that field with an id of an existing ride and hit submit
# I’m taken back to that mechanic's show page
# And I see the name of that newly added ride on this mechanics show page
#
# Ex:
# Mechanic: Kara Smith
# Years of Experience: 11
#
# Current rides they’re working on:
# The Frog Hopper
# Fahrenheit
# The Kiss Raise
#
# Add a ride to workload:
# Ride Id: _pretend_this_is_a_textfield_
# Submit

RSpec.describe 'the Mechanic show page' do
  before(:each) do
    @mech_1 = Mechanic.create!(name: 'Joe Shmoe', years_experience: 9)
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @wheel = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @dump = @six_flags.rides.create!(name: 'The Dump', thrill_rating: 7, open: true)

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

  xit 'adds an existing ride to the mechanic' do
    fill_in "ride_id", with: "#{@dump.id}"
    click_button "Submit"
    expect(page).to have_content(@dump.name)
  end
end
