require 'rails_helper'

RSpec.describe 'Amusement Park Show Page' do
  before(:each) do
    @amusement_park_1 = AmusementPark.create!(name: 'Elitches', admission_cost: 30)
    @amusement_park_2 = AmusementPark.create!(name: 'Best Park', admission_cost: 75)

    @ride_1 = @amusement_park_1.rides.create!(name: 'Tower of Doom', thrill_rating: 10, open: true)
    @ride_2 = @amusement_park_1.rides.create!(name: 'Ding Dong Dock', thrill_rating: 2, open: true)
    @ride_3 = @amusement_park_1.rides.create!(name: 'Boomerang', thrill_rating: 7, open: true)
    @ride_4 = @amusement_park_1.rides.create!(name: 'Mind Eraser', thrill_rating: 8, open: false)
    @ride_5 = @amusement_park_2.rides.create!(name: 'Woo', thrill_rating: 4, open: true)

    visit amusement_park_path(@amusement_park_1.id)
  end

  scenario 'visitor sees name and price for that amusement park' do
    save_and_open_page
    expect(page).to have_content(@amusement_park_1.name)
  end

  scenario 'visitor sees names of all rides at the park in alphabetical order' do
  end

  scenario 'visitor sees average thrill rating of park rides' do
  end
end
