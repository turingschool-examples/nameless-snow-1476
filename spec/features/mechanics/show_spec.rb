require 'rails_helper'
describe 'mechanic show page' do
  it 'I see their name, years of experience, and the rides they work on' do
    elitch = AmusementPark.create!(name: 'Elitches', admission_cost: 5)
    seth = Mechanic.create!(name: 'Seth', years_experience: 1)
    joe = Mechanic.create!(name: 'Joe', years_experience: 2)
    ride_1 = Ride.create!(name: 'Ride 1', thrill_rating: 1, open: true, amusement_park_id: elitch.id)
    ride_2 = Ride.create!(name: 'Ride 2', thrill_rating: 2, open: true, amusement_park_id: elitch.id)
    ride_3 = Ride.create!(name: 'Ride 3', thrill_rating: 2, open: true, amusement_park_id: elitch.id)
    mech_ride_1 = MechanicRide.create!(mechanic_id: seth.id, ride_id: ride_1.id)
    mech_ride_2 = MechanicRide.create!(mechanic_id: seth.id, ride_id: ride_2.id)
    mech_ride_3 = MechanicRide.create!(mechanic_id: joe.id, ride_id: ride_3.id)
    visit "/mechanics/#{seth.id}"
    expect(page).to have_content("Name: #{seth.name}")
    expect(page).to_not have_content(joe.name)
    expect(page).to have_content("Experience: #{seth.years_experience}")
    expect(page).to have_content("Rides: #{ride_1.name} #{ride_2.name}")
    expect(page).to_not have_content(ride_3.name)
  end

  it 'I only see rides that are open' do
    elitch = AmusementPark.create!(name: 'Elitches', admission_cost: 5)
    seth = Mechanic.create!(name: 'Seth', years_experience: 1)
    joe = Mechanic.create!(name: 'Joe', years_experience: 2)
    ride_1 = Ride.create!(name: 'Ride 1', thrill_rating: 1, open: true, amusement_park_id: elitch.id)
    ride_2 = Ride.create!(name: 'Ride 2', thrill_rating: 2, open: true, amusement_park_id: elitch.id)
    ride_3 = Ride.create!(name: 'Ride 3', thrill_rating: 2, open: false, amusement_park_id: elitch.id)
    mech_ride_1 = MechanicRide.create!(mechanic_id: seth.id, ride_id: ride_1.id)
    mech_ride_2 = MechanicRide.create!(mechanic_id: seth.id, ride_id: ride_2.id)
    mech_ride_3 = MechanicRide.create!(mechanic_id: seth.id, ride_id: ride_3.id)
    visit "/mechanics/#{seth.id}"
    expect(page).to have_content("Rides: #{ride_1.name} #{ride_2.name}")
    expect(page).to_not have_content(ride_3.name)
  end
end
