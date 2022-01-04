require 'rails_helper'

RSpec.describe 'the mechanics index' do
  it 'lists all of the mechanics with their attributes' do
    mech_1 = Mechanic.create!(name: "Jon", years_experience: 12)
    mech_2 = Mechanic.create!(name: "James", years_experience: 14)
    mech_3 = Mechanic.create!(name: "Sam", years_experience: 9)
    mech_4 = Mechanic.create!(name: "Mike", years_experience: 11)

    visit "/mechanics"
    expect(page).to have_content(mech_1.name)
    expect(page).to have_content(mech_1.years_experience)
    expect(page).to have_content(mech_2.name)
    expect(page).to have_content(mech_2.years_experience)
    expect(page).to have_content(mech_3.name)
    expect(page).to have_content(mech_3.years_experience)
    expect(page).to have_content(mech_4.name)
    expect(page).to have_content(mech_4.years_experience)
  end

  it 'shows average age of all mechanics' do
    mech_1 = Mechanic.create!(name: "Jon", years_experience: 12)
    mech_2 = Mechanic.create!(name: "James", years_experience: 14)
    mech_3 = Mechanic.create!(name: "Sam", years_experience: 9)
    mech_4 = Mechanic.create!(name: "Mike", years_experience: 11)

    visit "/mechanics"

    expect(page).to have_content("Average years of experience across all mechanics: 11.5")
  end

end
