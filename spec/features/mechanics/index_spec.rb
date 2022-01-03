require 'rails_helper'

RSpec.describe 'Mechanics Index Page' do
  it 'displays a header saying all mechanics' do
    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
  end

  it 'lists all the mechanics names and years of experience' do
    mechanic_1 = Mechanic.create!(name: "Robin", years_experience: 12)
    mechanic_2 = Mechanic.create!(name: "Daisy", years_experience: 20)
    mechanic_3 = Mechanic.create!(name: "Richard", years_experience: 4)

    visit '/mechanics'

    expect(page).to have_content("Robin")
    expect(page).to have_content("Daisy")
    expect(page).to have_content("Richard")
    expect(page).to have_content(12)
    expect(page).to have_content(20)
    expect(page).to have_content(4)
  end

  it 'displays the average years of experience across all mechanics' do
    mechanic_1 = Mechanic.create!(name: "Robin", years_experience: 12)
    mechanic_2 = Mechanic.create!(name: "Daisy", years_experience: 20)
    mechanic_3 = Mechanic.create!(name: "Richard", years_experience: 4)

    visit '/mechanics'

    expect(page).to have_content("Average years of experience: 12")
  end
end
