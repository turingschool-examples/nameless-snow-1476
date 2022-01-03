require 'rails_helper'

describe 'Mechanic Index' do
  before do
    visit '/mechanics'
  end

describe 'display' do
  it 'header' do
    expect(page).to have_content("All Mechanics")
  end

  it 'list of all mechanics names and years of experience' do
      within "#mechanic-#{@mechanic1.id}" do
        expect(page).to have_content(@mechanic1.name)
        expect(page).to have_content(@mechanic1.years_experience)
      end

      within "#mechanic-#{@mechanic2.id}" do
        expect(page).to have_content(@mechanic2.name)
        expect(page).to have_content(@mechanic2.years_experience)
      end
    end
  end

  it 'average years of experience across all mechanics' do
    expect(page).to have_content("Average years of experience: #{average_mechanic_experience}")
  end
end
