require 'rails_helper'

RSpec.describe 'mechanics index page' do
  before(:each) do
    @mechanic_1 = Mechanic.create(name: "Bob", years_experience: 10)
    @mechanic_2 = Mechanic.create(name: "Pam", years_experience: 14)
    @mechanic_3 = Mechanic.create(name: "Michael", years_experience: 3)

    visit '/mechanics'
  end

  describe 'when I visit the mechanics index page' do
    it 'shows me a header saying all mechanics' do
      expect(page).to have_content("All Mechanics")
    end

    it 'shows a list of all mechanics names and their years of experiences' do
      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.years_experience)
      expect(page).to have_content(@mechanic_2.name)
      expect(page).to have_content(@mechanic_2.years_experience)
      expect(page).to have_content(@mechanic_3.name)
      expect(page).to have_content(@mechanic_3.years_experience)
    end

    it 'shows the average years of experience across all mechanics' do
      expect(page).to have_content("Average Experience Across Mechanics: 9")
    end
  end
end
