require 'rails_helper'

RSpec.describe 'Mechanic Show page' do

  it 'visits mechanic show page, sees their name, years of experience, and the names of OPEN rides they’re working on' do
    amusement_park_1 = AmusementPark.create!(name: 'amusement_park_1', admission_cost: 1)

    ride1 = amusement_park_1.rides.create!(name: 'ride1', thrill_rating:1, open: true)
    ride2 = amusement_park_1.rides.create!(name: 'ride2', thrill_rating:2, open: false)
    ride3 = amusement_park_1.rides.create!(name: 'ride3', thrill_rating:3, open: true)

    mechanic1 = Mechanic.create!(name: 'mechanic1', years_of_experience: 1, rides: [ride1, ride2, ride3])

    visit "/mechanics/#{mechanic1.id}"

    expect(page).to have_content(mechanic1.name)
    expect(page).to have_content(mechanic1.years_of_experience)

    expect(page).to have_content(ride1.name)
    expect(page).to_not have_content(ride2.name)
    expect(page).to have_content(ride3.name)
  end

  it 'visits mechanic show page, sees a form to add ride to workload' do
    amusement_park_1 = AmusementPark.create!(name: 'amusement_park_1', admission_cost: 1)

    ride1 = amusement_park_1.rides.create!(name: 'ride1', thrill_rating:1, open: true)
    ride2 = amusement_park_1.rides.create!(name: 'ride2', thrill_rating:2, open: false)
    ride3 = amusement_park_1.rides.create!(name: 'ride3', thrill_rating:3, open: true)
    ride4 = amusement_park_1.rides.create!(name: 'ride4', thrill_rating:4, open: true)

    mechanic1 = Mechanic.create!(name: 'mechanic1', years_of_experience: 1, rides: [ride1, ride2, ride3])

    visit "/mechanics/#{mechanic1.id}"

    expect(page).to_not have_content(ride4.name)

    fill_in "name", with: ride4.name
    click_button "Submit"

    expect(current_path).to eq("/mechanics/#{mechanic1.id}")

    expect(page).to have_content(ride4.name)


  end
end
