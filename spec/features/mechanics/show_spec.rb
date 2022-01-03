require 'rails_helper'

RSpec.describe 'mechanic show page' do
  before(:each) do
    @park = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @ride = @park.rides.create!(name: "Frog Hopper", thrill_rating: 7, open: true)
    @ride2 = @park.rides.create!(name: "Fahrenheit", thrill_rating: 6, open: false)
    @ride3 = @park.rides.create!(name: "Fruit Splash", thrill_rating: 5, open: true)
    @ride4 = @park.rides.create!(name: "Twister", thrill_rating: 8, open: true)
    @mechanic = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    @mechanic2 = Mechanic.create!(name: "Jeff Burton", years_experience: 8)
    @mechanic3 = Mechanic.create(name: "Taylor Jennings", years_experience: 3)
    @mechanic.rides << @ride
    @mechanic.rides << @ride2
    @mechanic.rides << @ride3
    visit "/mechanics/#{@mechanic.id}"
  end

  it 'shows mechanic name' do
    expect(page).to have_content("Kara Smith")
  end

  it 'shows mechanic years of experience' do
    expect(page).to have_content("Years Experience: 11")
  end

  it 'shows assigned work order ride names, only open rides' do
    expect(page).to have_content("Frog Hopper")
    expect(page).to have_content("Fruit Splash")
    expect(page).not_to have_content("Fahrenheit")
    expect(page).not_to have_content("Twister")
  end

  it 'shows work orders in order of ride thrill rating, desc' do
    expect(@ride.name).to appear_before(@ride3.name)
  end
end
