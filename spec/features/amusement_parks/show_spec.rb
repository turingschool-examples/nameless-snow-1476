require 'rails_helper'

RSpec.describe 'amusement park show page' do

  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @hurler = @six_flags.rides.create!(name: 'Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

  end

  it 'displays attributes for amusement park' do
    visit "/amusement_parks/#{@six_flags.id}"

    expect(page).to have_content(@six_flags.name)
    expect(page).to have_content(@six_flags.admission_cost)
  end

  it 'displays rides in alphabetical order' do
    visit "/amusement_parks/#{@six_flags.id}"

    expect(@ferris.name).to appear_before(@hurler.name)
    expect(@hurler.name).to appear_before(@scrambler.name)
  end

  it 'displays average thrill rating for all rides' do
    visit "/amusement_parks/#{@six_flags.id}"

    expect(page).to have_content("Average Thrill Rating: 6/10")
  end

end
