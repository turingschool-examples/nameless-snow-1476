require 'rails_helper'

RSpec.describe 'Mechanic Index Page' do
  describe 'User Story 1' do

    it ' has a header saying All Mechanics' do
      visit '/mechanics'

      expect(page).to have_content("All Mechanics")
    end

    it 'has a list of all the mechanics names and years experience' do
      mechanic_1 = Mechanic.create!(name: "Rob", years_experience: 7)
      mechanic_2 = Mechanic.create!(name: "Dana", years_experience: 15)
      mechanic_3 = Mechanic.create!(name: "Burt", years_experience: 20)

      visit '/mechanics'

      expect(page).to have_content("Name: #{mechanic_1.name}")
      expect(page).to have_content("Years Experience: #{mechanic_1.years_experience}")
      expect(page).to have_content("Name: #{mechanic_2.name}")
      expect(page).to have_content("Years Experience: #{mechanic_2.years_experience}")
      expect(page).to have_content("Name: #{mechanic_3.name}")
      expect(page).to have_content("Years Experience: #{mechanic_3.years_experience}")
    end

    it 'has the average years of experience across all mechanics' do
      mechanic_1 = Mechanic.create!(name: "Rob", years_experience: 7)
      mechanic_2 = Mechanic.create!(name: "Dana", years_experience: 15)
      mechanic_3 = Mechanic.create!(name: "Burt", years_experience: 20)

      visit '/mechanics'

      expect(page).to have_content("Average Years Experience: 14")
    end
  end
end
