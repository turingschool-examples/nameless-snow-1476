require 'rails_helper'
# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics
RSpec.describe 'Mechanic index page' do
  it 'I see a header saying all mechanics' do
    mechanic_1 = Mechanic.create!(name: 'mech_1', years_experience: 10)
    mechanic_2 = Mechanic.create!(name: 'mech_2', years_experience: 5)
    mechanic_3 = Mechanic.create!(name: 'mech_3', years_experience: 15)

    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_2.name)
    expect(page).to have_content(mechanic_3.name)
    expect(page).to have_content(mechanic_1.years_experience)
    expect(page).to have_content(mechanic_2.years_experience)
    expect(page).to have_content(mechanic_3.years_experience)
    expect(page).to have_content("average years experience: 10")
  end
end