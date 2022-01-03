require 'rails_helper'

RSpec.describe 'the mechanics show page' do
  it "I see mechanic and their attributes" do
    mechanic1 = Mechanic.create!(name: 'Wade', years_experience: 14)
    mechanic2 = Mechanic.create!(name: 'brett', years_experience: 12)
    mechanic3 = Mechanic.create!(name: 'mack', years_experience: 10)
    visit "/mechanics/#{mechanic1.id}"
    expect(page).to have_content(mechanic1.name)
    expect(page).to have_content(mechanic1.years_experience)
    expect(page).to_not have_content(mechanic2.name)
    expect(page).to_not have_content(mechanic2.years_experience)
  end

  it "shows open rides and are listed in descending order" do
    amusement_park1 = AmusementPark.create!(name: 'Six Flags', admission_cost: 20)
    amusement_park2 = AmusementPark.create!(name: 'Dutch Wonderland', admission_cost: 30)

    ride1 = amusement_park1.rides.create!(name: 'zipper', thrill_rating: 3, open: true)
    ride2 = amusement_park1.rides.create!(name: 'dipper', thrill_rating: 4, open: true)
    ride3 = amusement_park1.rides.create!(name: 'clipper', thrill_rating: 6, open: false)
    ride4 = amusement_park2.rides.create!(name: 'pipper', thrill_rating: 4, open: true)

    mechanic1 = Mechanic.create!(name: 'Wade', years_experience: 14)
    mechanic2 = Mechanic.create!(name: 'brett', years_experience: 12)
    mechanic3 = Mechanic.create!(name: 'mack', years_experience: 10)

    MechanicRide.create!(mechanic: mechanic1, ride: ride1)
    MechanicRide.create!(mechanic: mechanic1, ride: ride2)
    MechanicRide.create!(mechanic: mechanic1, ride: ride3)
    MechanicRide.create!(mechanic: mechanic1, ride: ride4)
    visit "/mechanics/#{mechanic1.id}"

    expect(page).to have_content(ride4.name)
    expect(page).to have_content(ride2.name)
    expect(page).to have_content(ride1.name)
    expect(page).to_not have_content(ride3.name)

  end

  it "shows a form to add a new ride" do
    amusement_park1 = AmusementPark.create!(name: 'Six Flags', admission_cost: 20)
    amusement_park2 = AmusementPark.create!(name: 'Dutch Wonderland', admission_cost: 30)

    ride1 = amusement_park1.rides.create!(name: 'zipper', thrill_rating: 3, open: true)
    ride2 = amusement_park1.rides.create!(name: 'dipper', thrill_rating: 4, open: true)
    ride3 = amusement_park1.rides.create!(name: 'clipper', thrill_rating: 6, open: false)
    ride4 = amusement_park1.rides.create!(name: 'pipper', thrill_rating: 4, open: true)

    mechanic1 = Mechanic.create!(name: 'Wade', years_experience: 14)
    mechanic2 = Mechanic.create!(name: 'brett', years_experience: 12)
    mechanic3 = Mechanic.create!(name: 'mack', years_experience: 10)

    MechanicRide.create!(mechanic: mechanic1, ride: ride1)
    MechanicRide.create!(mechanic: mechanic1, ride: ride2)
    MechanicRide.create!(mechanic: mechanic1, ride: ride3)

    visit "/mechanics/#{mechanic1.id}"

    expect(page).to_not have_content(ride4.name)
    fill_in('Ride', with: "#{ride4.id}")
    click_button 'submit'
    expect(current_path).to eq("/mechanics/#{mechanic1.id}")
    expect(page).to have_content(ride4.name)

  end
end
