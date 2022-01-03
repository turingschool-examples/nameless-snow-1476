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
end
