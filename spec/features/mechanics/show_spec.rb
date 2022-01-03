require 'rails_helper'

RSpec.describe 'Mechanic Show Page', type: :feature do
  let!(:six_flags) {AmusementPark.create!(name: "Six Flags", admission_cost: 20)}

  let!(:splash) {six_flags.rides.create!(name: "Log Ride", thrill_rating: 3, open: true)}
  let!(:coaster) {six_flags.rides.create!(name: "Cyclone", thrill_rating: 5, open: true)}
  let!(:hot_dog) {six_flags.rides.create!(name: "Hot Dog Stand", thrill_rating: 1, open: false)}
  let!(:whirl) {six_flags.rides.create!(name: "Whirly Dirly", thrill_rating: 2, open: true)}

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

      most_thrilling = coaster.name
      least_thrilling = splash.name

      expect(most_thrilling).to appear_before(least_thrilling, only_text: true)
    end
  end

  describe 'form to add ride to mechanic workload' do
    it 'has a form' do
      visit "/mechanics/#{mechanic_1.id}"

      expect(page).to have_content("Add Ride to Workload")
      expect(page).to have_field("Ride ID")
      expect(page).to have_button("Submit")
    end

    it 'adds a ride to the mechanic workload and displays on page after submission' do
      visit "/mechanics/#{mechanic_1.id}"

      expect(page).to have_content(splash.name)
      expect(page).to have_content(coaster.name)

      expect(page).to have_no_content(hot_dog.name)
      expect(page).to have_no_content(whirl.name)

      fill_in 'ride_id', with: whirl.id
      click_button 'Submit'

      expect(current_path).to eq("/mechanics/#{mechanic_1.id}")
      
      within "#rides" do
        expect(page).to have_content(splash.name)
        expect(page).to have_content(coaster.name)
        expect(page).to have_content(whirl.name)

        expect(page).to have_no_content(hot_dog.name)

        no_1_thrilling = coaster.name
        no_2_thrilling = splash.name
        no_3_thrilling = whirl.name

        expect(no_1_thrilling).to appear_before(no_2_thrilling, only_text: true)
        expect(no_2_thrilling).to appear_before(no_3_thrilling, only_text: true)
      end
    end
  end
end
