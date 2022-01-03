require 'rails_helper'

RSpec.describe 'Mechanic Index Page' do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'George Everett', years_experience: 5)
    @mechanic_2 = Mechanic.create!(name: 'Max Jonson', years_experience: 4)
    @mechanic_3 = Mechanic.create!(name: 'Lorinda Smith', years_experience: 13)
    @mechanic_4 = Mechanic.create!(name: 'Maria Grace', years_experience: 8)

    visit mechanics_path
  end

  scenario 'visitor sees header for all mechanics' do
    expect(page).to have_content("All Mechanics")
  end

  scenario 'visitor sees list of all mechanic names and years of experience' do
    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_experience)
    expect(page).to have_content(@mechanic_2.name)
    expect(page).to have_content(@mechanic_2.years_experience)
    expect(page).to have_content(@mechanic_3.name)
    expect(page).to have_content(@mechanic_3.years_experience)
    expect(page).to have_content(@mechanic_4.name)
    expect(page).to have_content(@mechanic_4.years_experience)
  end

  scenario 'visitor sees average years of experiences across all mechanics' do
  end
end
