require 'rails_helper'

RSpec.describe 'Mechanic index page' do
  before :each do
    @greg = Mechanic.create!(name: "Greg", years_experience: 6)
    @mary = Mechanic.create!(name: "Mary", years_experience: 8)
    @jones = Mechanic.create!(name: "Jones", years_experience: 16)
  end

  it 'has a header' do
    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
  end

  it "has all the mechanic's names and years of exp" do
    visit '/mechanics'

    expect(page).to have_content(@greg.name)
    expect(page).to have_content(@greg.years_experience)
    expect(page).to have_content(@mary.name)
    expect(page).to have_content(@mary.years_experience)
    expect(page).to have_content(@jones.name)
    expect(page).to have_content(@jones.years_experience)
  end

  it 'shows the average experience for all mechanics' do
    visit '/mechanics'

    expect(page).to have_content("Average Years of Experience: 10")
  end
end
