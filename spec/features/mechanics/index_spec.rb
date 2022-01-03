require 'rails_helper'

RSpec.describe 'mechanics index page' do
  it 'has a header' do
    visit mechanics_url
    within '.header' do
      expect(page).to have_content('All Mechanics')
    end
  end
  it 'lists all mechanics names and years exp' do
    mech_1 = Mechanic.create!(name: 'Tom', years_experience: 5)
    mech_2 = Mechanic.create!(name: 'Tom_2', years_experience: 3)
    mech_3 = Mechanic.create!(name: 'Tom_3', years_experience: 2)

    visit mechanics_url
    within '.mechanics' do
      expect(page).to have_content("Name: #{mech_1.name}, years of experience: #{mech_1.years_experience}")
      expect(page).to have_content("Name: #{mech_2.name}, years of experience: #{mech_2.years_experience}")
      expect(page).to have_content("Name: #{mech_3.name}, years of experience: #{mech_3.years_experience}")
    end
  end
  it 'lists average years exp of all the mechanics combined' do
    mech_1 = Mechanic.create!(name: 'Tom', years_experience: 5)
    mech_2 = Mechanic.create!(name: 'Tom_2', years_experience: 3)
    mech_3 = Mechanic.create!(name: 'Tom_3', years_experience: 2)
    visit mechanics_url

    within '.mechanics' do
      expect(page).to have_content("Average of combined years of experience: #{Mechanic.average_of_exp}")
    end
  end
end
