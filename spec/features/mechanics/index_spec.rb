# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics

require 'rails_helper'

RSpec.describe Mechanic, type: :feature do
  it 'exists' do
    mechanic = Mechanic.create
    expect(mechanic).to be_a(Mechanic)
  end 


  it 'has attributes' do
    sally = Mechanic.create!(name: "Sally Field", years_experience: 15)
    martin = Mechanic.create!(name: "Martin Sheen", years_experience: 20)
    andrew = Mechanic.create!(name: "Andrew Garfield", years_experience: 11)
    emma = Mechanic.create!(name: "Emma Stone", years_experience: 12)
    expect(sally.name).to eq("Sally Field")
    expect(sally.years_experience).to eq(15)
    expect(martin.name).to eq("Martin Sheen")
    expect(martin.years_experience).to eq(20)
    expect(andrew.name).to eq("Andrew Garfield")
    expect(andrew.years_experience).to eq(11)
    expect(emma.name).to eq("Emma Stone")
    expect(emma.years_experience).to eq(12)

  end

  it 'displays mechanics on page' do
    sally = Mechanic.create!(name: "Sally Field", years_experience: 15)
    martin = Mechanic.create!(name: "Martin Sheen", years_experience: 20)
    andrew = Mechanic.create!(name: "Andrew Garfield", years_experience: 11)
    emma = Mechanic.create!(name: "Emma Stone", years_experience: 12)

    visit "/mechanics"

    expect(page).to have_content(sally.name)
    expect(page).to have_content(sally.years_experience)
    expect(page).to have_content(martin.name)
    expect(page).to have_content(martin.years_experience)
    expect(page).to have_content(andrew.name)
    expect(page).to have_content(andrew.years_experience)
    expect(page).to have_content(emma.name)
    expect(page).to have_content(emma.years_experience)

  end

end