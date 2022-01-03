require 'rails_helper'
# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)
RSpec.describe 'Mechanic show page' do
  it 'I see their name, years of experience, and the names of the rides they are working on' do
    mechanic_1 = Mechanic.create!(name: 'mech_1', years_experience: 10)
    mechanic_2 = Mechanic.create!(name: 'mech_2', years_experience: 5)
    ride_1 = AmusementPark.ride.create!(name: 'scary', thrill_rating: 4, open: true)
    ride_2 = AmusementPark.ride.create!(name: 'scariest', thrill_rating: 10, open: true)
    ride_3 = AmusementPark.ride.create!(name: 'scarier', thrill_rating: 6, open: false)
    ride_4 = AmusementPark.ride.create!(name: 'really scary', thrill_rating: 8, open: true)
    mech_rides_1 = MechanicRides.create!(mechanic_id: mechanic_1.id, ride_id: ride_1.id)
    mech_rides_2 = MechanicRides.create!(mechanic_id: mechanic_1.id, ride_id: ride_3.id)
    mech_rides_3 = MechanicRides.create!(mechanic_id: mechanic_2.id, ride_id: ride_2.id)
    mech_rides_3 = MechanicRides.create!(mechanic_id: mechanic_1.id, ride_id: ride_4.id)

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_1.thrill_rating)
    expect(page).to have_content(ride_1.open)
    expect(page).to_not have_content(ride_3.name)
    expect(page).to_not have_content(ride_3.thrill_rating)
    expect(page).to_not have_content(ride_3.open)
    #expect ride 4 to show before ride 1
  end
end