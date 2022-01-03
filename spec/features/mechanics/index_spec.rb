require 'rails_helper'

RSpec.describe 'mechanics index page' do
  before(:each) do
    @mechanic = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    @mechanic2 = Mechanic.create!(name: "Jeff Burton", years_experience: 8)
    @mechanic3 = Mechanic.create(name: "Taylor Jennings", years_experience: 3)
    visit "/mechanics"
  end

  it 'has a header' do
    within("#mechanics-header") do
      expect(page).to have_content("All Mechanics")
    end
  end

  it 'has a list of all mechanics names' do
    expect(page).to have_content("Kara Smith")
    expect(page).to have_content("Jeff Burton")
    expect(page).to have_content("Taylor Jennings")
  end

  it 'shows each mechanics years experience' do
    within("#mechanics-#{@mechanic.id}") do
      expect(page).to have_content("Years Experience: 11")
    end
    within("#mechanics-#{@mechanic2.id}") do
      expect(page).to have_content("Years Experience: 8")
    end
    within("#mechanics-#{@mechanic3.id}") do
      expect(page).to have_content("Years Experience: 3")
    end
  end

  it 'shows the average years of experience of all' do
    expect(page).to have_content("All Average Years Experience: 7")
  end
end
