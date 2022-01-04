require 'rails_helper'

RSpec.describe 'the mechanics show page' do
  it 'lists all of the mechanics with their attributes' do
    amus_1 = AmusementPark.create!(name: "name_1", admission_cost: 75)
    mech_1 = Mechanic.create!(name: "Jon", years_experience: 12)
    mech_2 = Mechanic.create!(name: "James", years_experience: 14)
    mech_3 = Mechanic.create!(name: "Sam", years_experience: 9)
    mech_4 = Mechanic.create!(name: "Mike", years_experience: 11)
    ride_1 = amus_1.rides.create!(name: "ride_1", thrill_rating: 9, open: true)
    ride_2 = amus_1.rides.create!(name: "ride_2", thrill_rating: 1, open: true)
    ride_3 = amus_1.rides.create!(name: "ride_3", thrill_rating: 6, open: false)
    ride_4 = amus_1.rides.create!(name: "ride_4", thrill_rating: 3, open: true)

    mech_1.rides << ride_1
    mech_1.rides << ride_2
    mech_1.rides << ride_3
    mech_1.rides << ride_4

    visit "/mechanics/#{mech_1.id}"
    expect(page).to have_content(mech_1.name)
    expect(page).to have_content(mech_1.years_experience)

    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_4.name)
    expect(page).to_not have_content(ride_3.name)


    expect(ride_1.name).to appear_before(ride_4.name)
    expect(ride_4.name).to appear_before(ride_2.name)
  end

  it 'lists all of the mechanics with their attributes' do
    amus_1 = AmusementPark.create!(name: "name_1", admission_cost: 75)
    mech_1 = Mechanic.create!(name: "Jon", years_experience: 12)
    mech_2 = Mechanic.create!(name: "James", years_experience: 14)
    mech_3 = Mechanic.create!(name: "Sam", years_experience: 9)
    mech_4 = Mechanic.create!(name: "Mike", years_experience: 11)
    ride_1 = amus_1.rides.create!(name: "ride_1", thrill_rating: 9, open: true)
    ride_2 = amus_1.rides.create!(name: "ride_2", thrill_rating: 1, open: true)
    ride_3 = amus_1.rides.create!(name: "ride_3", thrill_rating: 6, open: false)
    ride_4 = amus_1.rides.create!(name: "ride_4", thrill_rating: 3, open: true)
    ride_5 = amus_1.rides.create!(name: "ride_5", thrill_rating: 4, open: true)

    mech_1.rides << ride_1
    mech_1.rides << ride_2
    mech_1.rides << ride_3
    mech_1.rides << ride_4

    visit "/mechanics/#{mech_1.id}"
    save_and_open_page
    fill_in 'Select ride', with: "#{ride_5.id}"
    click_on ("submit")
    expect(current_path).to eq("/mechanics/#{mech_1.id}")

    expect(page).to have_content(ride_5.name)
  end
end
