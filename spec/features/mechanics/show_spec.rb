require 'rails_helper'

RSpec.describe 'Mechanic Show Page', type: :feature do
  let!(:six_flags) {AmusementPark.create!(name: "Six Flags", admission_cost: 20)}

  let!(:splash) {six_flags.rides.create!(name: "Log Ride", thrill_rating: 3, open: true)}
  let!(:coaster) {six_flags.rides.create!(name: "Cyclone", thrill_rating: 5, open: true)}
  let!(:hot_dog) {six_flags.rides.create!(name: "Hot Dog Stand", thrill_rating: 1, open: false)}

  let!(:mechanic_1) {Mechanic.create!(name: "Ted", years_of_experience: 10, rides: [splash, coaster, hot_dog])}
  let!(:mechanic_2) {Mechanic.create!(name: "Meg", years_of_experience: 3, rides: [splash])}
  let!(:mechanic_3) {Mechanic.create!(name: "Bertha", years_of_experience: 6, rides: [hot_dog])}

  it 'shows mechanic name, years of experience, names of open rides they work on' do
    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content("Name: #{mechanic_1.name}")
    expect(page).to have_content("Years of Experience: #{mechanic_1.years_of_experience}")

    within "#rides" do
      expect(page).to have_content(splash.name)
      expect(page).to have_content(coaster.name)
      expect(page).to have_no_content(hot_dog.name)

      let(:most_thrilling) { "<li>#{coaster.name}</li>"}
      let(:least_thrilling) { "<li>#{splash.name}</li>"}

      expect(most_thrilling).to appear_before(least_thrilling)
    end
  end
  # As a user,
  # When I visit a mechanic show page
  # I see their name, years of experience, and the names of rides they’re working on
  # And I only see rides that are open
  # And the rides are listed by thrill rating in descending order (most thrills first)


end
