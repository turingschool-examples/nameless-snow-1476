require 'rails_helper'

RSpec.describe 'Mechanic show page' do

  it 'can show information about specific mechanic' do
    amusement_park_1 = AmusementPark.create!(name: 'Amusement Park 1', admission_cost: 10)

    mechanic_1 = Mechanic.create!(name: 'Mechanic 1', years_experience: 4)
    mechanic_2 = Mechanic.create!(name: 'Mechanic 2', years_experience: 5)
    mechanic_3 = Mechanic.create!(name: 'Mechanic 3', years_experience: 6)

    ride_1 = Ride.create!(name: 'Ride 1', thrill_rating: '7', open: true, amusement_park_id: amusement_park_1.id)
    ride_2 = Ride.create!(name: 'Ride 2', thrill_rating: '8', open: true, amusement_park_id: amusement_park_1.id)
    ride_3 = Ride.create!(name: 'Ride 3', thrill_rating: '9', open: false, amusement_park_id: amusement_park_1.id)

    mr11 = MechanicRide.create!(mechanic_id: mechanic_1.id, ride_id: ride_1.id)
    mr12 = MechanicRide.create!(mechanic_id: mechanic_1.id, ride_id: ride_2.id)
    mr13 = MechanicRide.create!(mechanic_id: mechanic_1.id, ride_id: ride_3.id)

    visit "/mechanics/#{mechanic_1.id}"
    save_and_open_page
    expect(page).to have_content('Mechanic name: Mechanic 1')
    expect(page).to have_content('Mechanic years of experience: 4')

    expect(page).to have_content('Ride 1')
    expect(page).to have_content('Ride 2')
    expect(page).to_not have_content('Ride 3')


    expect('Ride 2').to appear_before('Ride 1')

  end

  it 'can can add ride for mechanic to work on' do
    amusement_park_1 = AmusementPark.create!(name: 'Amusement Park 1', admission_cost: 10)

    mechanic_1 = Mechanic.create!(name: 'Mechanic 1', years_experience: 4)
    mechanic_2 = Mechanic.create!(name: 'Mechanic 2', years_experience: 5)
    mechanic_3 = Mechanic.create!(name: 'Mechanic 3', years_experience: 6)

    ride_1 = Ride.create!(name: 'Ride 1', thrill_rating: '7', open: true, amusement_park_id: amusement_park_1.id)
    ride_2 = Ride.create!(name: 'Ride 2', thrill_rating: '8', open: true, amusement_park_id: amusement_park_1.id)
    ride_3 = Ride.create!(name: 'Ride 3', thrill_rating: '9', open: false, amusement_park_id: amusement_park_1.id)

    mr11 = MechanicRide.create!(mechanic_id: mechanic_1.id, ride_id: ride_1.id)
    mr12 = MechanicRide.create!(mechanic_id: mechanic_1.id, ride_id: ride_2.id)
    mr13 = MechanicRide.create!(mechanic_id: mechanic_1.id, ride_id: ride_3.id)

    visit "/mechanics/#{mechanic_1.id}"
    #
    # save_and_open_page

    fill_in 'Name', with: "Ride 4"
    fill_in 'thrill_rating', with: "10"
    fill_in 'Open', with: "True"

    click_on "Save"

    expect(page).to have_address("/mechanics/#{mechanic_1.id}")
    expect(page).to have_content('Ride 4')


  end

end
