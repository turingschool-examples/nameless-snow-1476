require 'rails_helper'

RSpec.describe 'mechanics show page' do
  it 'has a header called "All Mechanics"' do
    visit '/mechanics'
    expect(page).to have_content("All Mechanics")
  end

  it "lists all mechanics" do
    mech_1 = create(:mechanic, name: 'Bob')
    mech_2 = create(:mechanic, name: 'Terry')

    visit '/mechanics'

    expect(page).to have_content('Bob')
    expect(page).to have_content('Terry')
  end

  it "lists the age of all mechanics" do
    mech_1 = create(:mechanic, years_experience: 10)
    mech_2 = create(:mechanic, years_experience: 12)

    visit '/mechanics'

    expect(page).to have_content(10)
    expect(page).to have_content(12)
  end

  it 'lists the average years of experience across all mechanics' do
    mech_1 = create(:mechanic, years_experience: 5)
    mech_2 = create(:mechanic, years_experience: 3)
    mech_3 = create(:mechanic, years_experience: 10)

    visit '/mechanics'

    expect(page).to have_content(Mechanic.avg_years_experience)
  end
end
