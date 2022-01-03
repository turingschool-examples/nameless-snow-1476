require 'rails_helper'

RSpec.describe 'the mechanics show page' do
  it "I see mechanic and their attributes" do
    mechanic1 = Mechanic.create!(name: 'Wade', years_experience: 14)
    mechanic2 = Mechanic.create!(name: 'brett', years_experience: 12)
    mechanic3 = Mechanic.create!(name: 'mack', years_experience: 10)
    visit "/mechanics/#{mechanic1.id}"
    expect(page).to have_content(mechanic1.name)
    expect(page).to have_content(mechanic1.years_experience)
    expect(page).to_not have_content(mechanic2.name)
    expect(page).to_not have_content(mechanic2.years_experience)
  end
end
