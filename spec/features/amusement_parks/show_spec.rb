require 'rails_helper'

RSpec.describe 'amusement park show page' do
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
    visit "/amusement_parks/#{@park.id}"
  end

  it 'shows the name of the amusement park' do
    expect(page).to have_content("Six Flags")
  end

  it 'shows price of admissions' do
    expect(page).to have_content("Admission Price: $75")
  end

  it 'lists all rides alphabetically' do
    expect(page).to have_content("Frog Hopper")
    expect(page).to have_content("Fahrenheit")
    expect(page).to have_content("Fruit Splash")
    expect(page).to have_content("Twister")
    expect(@ride2.name).to appear_before(@ride.name)
    expect(@ride.name).to appear_before(@ride3.name)
    expect(@ride3.name).to appear_before(@ride4.name)
  end

  it 'shows average thrill rating for rides' do
    expect(page).to have_content("Average Thrill Rating of Rides: 6/10")
  end
end
