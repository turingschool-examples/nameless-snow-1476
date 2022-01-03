require 'rails_helper'

RSpec.describe 'mechanics index' do
  before do
    @frank = Mechanic.create!(name: "Frank", years_experience: 2)
    @kara = Mechanic.create!(name: "Kara", years_experience: 12)
    visit '/mechanics'
  end

  it 'I see a header saying “All Mechanics”' do
    expect(page).to have_content("All Mechanics")
  end

  it 'I see a list of all mechanic’s names and their years of experience' do
    expect(page).to have_content(@frank.name)
    expect(page).to have_content(@frank.years_experience)
    expect(page).to have_content(@kara.name)
    expect(page).to have_content(@kara.years_experience)
  end

  it 'I see the average years of experience across all mechanics' do
    expect(page).to have_content("Average years experience across mechanics: 7")
  end 
end
