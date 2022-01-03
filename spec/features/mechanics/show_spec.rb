require 'rails_helper'

RSpec.describe 'mechanics show' do
  before do
    @frank = Mechanic.create!(name: "Frank", years_experience: 2)
    @kara = Mechanic.create!(name: "Kara", years_experience: 12)
    @amusement_park = AmusementPark.create!(name: "park", admission_cost: 10)
    @frank_ride1 = @frank.rides.create!(name: "ride1", thrill_rating: 2, open: true, amusement_park_id: @amusement_park.id)
    @frank_ride2 = @frank.rides.create!(name: "ride2", thrill_rating: 5, open: false, amusement_park_id: @amusement_park.id)
    @frank_ride3 = @frank.rides.create!(name: "ride3", thrill_rating: 5, open: true, amusement_park_id: @amusement_park.id)
    @kara_ride1 = @kara.rides.create!(name: "ride4", thrill_rating: 10, open: true, amusement_park_id: @amusement_park.id)
    @ride11 = Ride.create!(name: "ride11", thrill_rating: 10, open: true, amusement_park_id: @amusement_park.id)
  end

  it 'I see their name, years of experience, and the names of rides they’re working on' do
    visit "/mechanics/#{@frank.id}"
    expect(page).to have_content(@frank.name)
    expect(page).to have_content(@frank.years_experience)
    expect(page).to have_content("Rides working: #{@frank_ride3.name}")
    expect(page).to_not have_content(@kara.name)
  end

  it 'I only see rides that are open' do
    visit "/mechanics/#{@frank.id}"
    expect(page).to have_content(@frank_ride1.name)
    expect(page).to_not have_content(@frank_ride2.name)
  end

  it 'the rides are listed by thrill rating in descending order (most thrills first)' do
    visit "/mechanics/#{@frank.id}"
    expect(@frank_ride3.name).to appear_before(@frank_ride1.name)
  end

  it 'I see a form to add a ride to their workload' do
    visit "/mechanics/#{@frank.id}"
    expect(page).to have_content("Add a ride to workload")
    expect(page).to have_button("Add ride")
    expect(page).to have_field('ride_id')
  end

  it 'I’m taken back to that mechanics show page' do
    visit "/mechanics/#{@frank.id}"
    fill_in "Ride id", with: "#{@ride11.id}"
    click_button "Add ride"
    expect(current_path).to eq("/mechanics/#{@frank.id}")
  end

  it 'I see the name of that newly added ride on this mechanics show page' do
    visit "/mechanics/#{@frank.id}"
    fill_in "Ride id", with: "#{@ride11.id}"
    click_button "Add ride"
    expect(page).to have_content("Rides working: #{@ride11.name}")
  end
end
