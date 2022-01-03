require 'rails_helper'

RSpec.describe 'Amusement Park show page' do
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 5, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 7, open: true)
    @wheel = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @mind = @six_flags.rides.create!(name: 'Mind Eraser', thrill_rating: 9, open: true)

    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
  end

  it 'has the name and admission cost' do
    visit "/amusement_parks/#{@six_flags.id}"

    expect(page).to have_content(@six_flags.name)
    expect(page).to have_content(@six_flags.admission_cost)
    expect(page).to_not have_content(@universal.name)
    expect(page).to_not have_content(@universal.admission_cost)
  end

  it 'shows all the rides listed in alphabetical order' do
    visit "/amusement_parks/#{@six_flags.id}"

    expect(@wheel.name).to appear_before(@mind.name)
    expect(@mind.name).to appear_before(@hurler.name)
    expect(@hurler.name).to appear_before(@scrambler.name)
  end

  it 'has the average thrill rating shown (out of ten)' do
    visit "/amusement_parks/#{@six_flags.id}"

    expect(page).to have_content("Average Thrill Rating of Rides: 7.0/10")
  end
end
