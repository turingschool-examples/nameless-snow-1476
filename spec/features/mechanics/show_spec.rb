require 'rails_helper'

# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)

RSpec.describe 'mechanic show' do
  it 'shows the mechanics attributes and open rides theyre working on' do
    mechanic = Mechanic.create!(name: "Sally Field", years_experience: 15)

    visit "/mechanics/#{mechanic.id}"

    expect(page).to have_content(mechanic.name)
    expect(page).to have_content(mechanic.years_experience)
    expect(page).to have_content(mechanic.rides.name)

    
  end
end