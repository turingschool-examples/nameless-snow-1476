require 'rails_helper'

RSpec.describe 'Mechanics Index Page', type: :feature do
  let!(:six_flags) {AmusementPark.create!(name: "Six Flags", admission_cost: 20)}

  let!(:splash) {six_flags.rides.create!(name: "Log Ride", thrill_rating: 3, open: true)}
  let!(:coaster) {six_flags.rides.create!(name: "Cyclone", thrill_rating: 5, open: true)}

  let!(:mechanic_1) {Mechanic.create!(name: "Ted", years_of_experience: 10, rides: [splash, coaster])}
  let!(:mechanic_2) {Mechanic.create!(name: "Meg", years_of_experience: 3, rides: [splash])}
  let!(:mechanic_3) {Mechanic.create!(name: "Bertha", years_of_experience: 6)}

  it 'shows mechanics names, years of expereince, and average years of experience' do
    visit '/mechanics'

    expect(page).to have_content('All Mechanics')

    within "#mechanics-#{mechanic_1.id}" do
      expect(page).to have_content(mechanic_1.name)
      expect(page).to have_content("Years of Experience: #{mechanic_1.years_of_experience}")
    end

    within "#mechanics-#{mechanic_2.id}" do
      expect(page).to have_content(mechanic_2.name)
      expect(page).to have_content("Years of Experience: #{mechanic_2.years_of_experience}")
    end

    average_years_of_experience = (mechanic_1.years_of_experience + mechanic_2.years_of_experience + mechanic_3.years_of_experience) / 3

    expect(page).to have_content("Average Years of Experience: #{average_years_of_experience.round(1)}")
  end
end
