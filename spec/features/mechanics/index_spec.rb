require 'spec_helper'

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

    expect(page).to have_content("All Mechanics")
  end
end
