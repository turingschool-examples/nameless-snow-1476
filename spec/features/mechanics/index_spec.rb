require 'rails_helper'

RSpec.describe 'mechanic index page' do
  it "And I see a list of all mechanic’s names and their years of experience" do

    mechanic1 = Mechanic.create!(name: 'Wade', years_experience: 14)
    mechanic2 = Mechanic.create!(name: 'brett', years_experience: 12)
    mechanic3 = Mechanic.create!(name: 'mack', years_experience: 10)
    visit '/mechanics'
    expect(page).to have_content(mechanic1.name)
    expect(page).to have_content(mechanic2.name)
    expect(page).to have_content(mechanic3.name)
    expect(page).to have_content(mechanic1.years_experience)
    expect(page).to have_content(mechanic2.years_experience)
    expect(page).to have_content(mechanic3.years_experience)
  end
end
