require 'rails_helper'

RSpec.describe 'Mechanic Show Page' do

  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'George Everett', years_experience: 5)
    @mechanic_2 = Mechanic.create!(name: 'Max Jonson', years_experience: 4)
    @mechanic_3 = Mechanic.create!(name: 'Lorinda Smith', years_experience: 13)
    @mechanic_4 = Mechanic.create!(name: 'Maria Grace', years_experience: 8)

    @amusement_park_1 = AmusementPark.create!(name: 'Elitches', admission_cost: 30)

    @ride_1 = @amusement_park_1.rides.create!(name: 'Tower of Doom', thrill_rating: 10, open: true)
    @ride_2 = @amusement_park_1.rides.create!(name: 'Ding Dong Dock', thrill_rating: 2, open: true)
    @ride_3 = @amusement_park_1.rides.create!(name: 'Boomerang', thrill_rating: 7, open: true)
    @ride_4 = @amusement_park_1.rides.create!(name: 'Mind Eraser', thrill_rating: 8, open: false)
    @ride_5 = @amusement_park_1.rides.create!(name: 'Woo', thrill_rating: 4, open: true)

    @ride_1.mechanics << @mechanic_1
    @ride_2.mechanics << @mechanic_1
    @ride_3.mechanics << @mechanic_1
    @ride_4.mechanics << @mechanic_1

    visit mechanic_path(@mechanic_1.id)
  end

  scenario 'visitor sees mechanic name and years of experience' do
    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_experience)
    save_and_open_page
  end

  scenario 'visitor sees the names of the rides mechanic is working on' do
    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_2.name)
    expect(page).to have_content(@ride_3.name)
    expect(page).to have_content(@ride_4.name)
    expect(page).to_not have_content(@ride_5.name)
  end

  scenario 'visitor sees only rides that are open' do
  end

  scenario 'visitor sees rides listed by thrill rating in descending order' do
  end
end
