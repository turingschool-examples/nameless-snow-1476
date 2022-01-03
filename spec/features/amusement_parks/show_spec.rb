require 'rails_helper'

RSpec.describe 'Amusement Park Show Page', type: :feature do
  let!(:six_flags) {AmusementPark.create!(name: "Six Flags", admission_cost: 20)}

  let!(:splash) {six_flags.rides.create!(name: "Log Ride", thrill_rating: 3, open: true)}
  let!(:coaster) {six_flags.rides.create!(name: "Cyclone", thrill_rating: 5, open: true)}
  let!(:hot_dog) {six_flags.rides.create!(name: "Hot Dog Stand", thrill_rating: 1, open: false)}
  let!(:whirl) {six_flags.rides.create!(name: "Whirly Dirly", thrill_rating: 2, open: true)}

  let!(:mechanic_1) {Mechanic.create!(name: "Ted", years_of_experience: 10, rides: [splash, coaster, hot_dog])}
  let!(:mechanic_2) {Mechanic.create!(name: "Meg", years_of_experience: 3, rides: [splash])}
  let!(:mechanic_3) {Mechanic.create!(name: "Bertha", years_of_experience: 6, rides: [hot_dog])}

  it 'shows park information' do
    visit "/amusement_parks/#{six_flags.id}"

    expect(page).to have_content(six_flags.name)
    expect(page).to have_content(six_flags.admission_cost)
    expect(page).to have_content(splash.name)
    expect(page).to have_content(coaster.name)
    expect(page).to have_content(hot_dog.name)
    expect(page).to have_content(whirl.name)
  end

  it 'displays rides in alphabetical order' do
    visit "/amusement_parks/#{six_flags.id}"

    expect("Cyclone").to appear_before("Hot Dog", only_text: true)
    expect("Hot Dog").to appear_before("Log Ride", only_text: true)
    expect("Log Ride").to appear_before("Whirly Dirly", only_text: true)
  end

  it 'displays the average thrill rating of rides at the park' do
    visit "/amusement_parks/#{six_flags.id}"

    average_thrill_rating = (splash.thrill_rating + coaster.thrill_rating + hot_dog.thrill_rating + whirl.thrill_rating) / 4

    expect(page).to have_content("Average Thrill Rating: #{average_thrill_rating}")
  end
end
