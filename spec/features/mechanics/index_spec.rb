require 'rails_helper'

RSpec.describe 'Mechanic Index page' do
  it "visits mechanics index page, sees header and a list of the mechanics names and their years of experience and the average years of experience across mechanics" do
    mechanic1 = Mechanic.create!(name: 'mechanic1', years_of_experience: 1)
    mechanic2 = Mechanic.create!(name: 'mechanic2', years_of_experience: 2)
    mechanic3 = Mechanic.create!(name: 'mechanic3', years_of_experience: 3)

    visit '/mechanics'

    expect(page).to have_content("All Mechanics")

    expect(page).to have_content(mechanic1.name)
    expect(page).to have_content(mechanic2.name)
    expect(page).to have_content(mechanic3.name)

    expect(page).to have_content(mechanic1.years_of_experience)
    expect(page).to have_content(mechanic2.years_of_experience)
    expect(page).to have_content(mechanic3.years_of_experience)

    expect(page).to have_content("Average Years of Experience: #{Mechanic.average_years_of_experience}")
  end
end
