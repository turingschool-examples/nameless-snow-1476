require 'rails_helper'

RSpec.describe 'mechanics index page', type: :feature do
  let!(:mechanic_1) { Mechanic.create!(name: 'name_1', years_experience: 1) }
  let!(:mechanic_2) { Mechanic.create!(name: 'name_2', years_experience: 2) }

  before(:each) { visit mechanics_path }

  describe 'view elements' do
    it 'should display a header saying All Mechanics' do
      expect(page).to have_css("h1", text: "All Mechanics")
    end

    it 'should display a list of all mechanics and their info' do
      within("#mechanic-#{mechanic_1.id}") do
        expect(page).to have_content(mechanic_1.name)
        expect(page).to have_content(mechanic_1.years_experience)
      end

      within("#mechanic-#{mechanic_2.id}") do
        expect(page).to have_content(mechanic_2.name)
        expect(page).to have_content(mechanic_2.years_experience)
      end
    end

    it 'should display the average years experience of all mechanics' do
      average = (mechanic_1.years_experience + mechanic_2.years_experience) / 2.0
      expect(page).to have_content("Average Years of Experience: #{average}")
    end
  end
end