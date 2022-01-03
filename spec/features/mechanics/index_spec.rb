require 'rails_helper'

RSpec.describe 'mechanics' do
  let!(:larry){Mechanic.create!(name: "Larry", years_experience: 9)}
  let!(:george){Mechanic.create!(name: "George", years_experience: 3)}
  let!(:carol){Mechanic.create!(name: "Carol", years_experience: 12)}

  describe 'when a user visits the index page' do
    it "shows all of the mechanics with names and experience " do
      visit '/mechanics'

      expect(page).to have_content("All Mechanics")

      expect(page).to have_content(larry.name)
      expect(page).to have_content(george.name)
      expect(page).to have_content(carol.name)
    end

    it "shows the average age of all the mechanics" do
      visit '/mechanics'

      expect(page).to have_content("All Mechanics")
      expect(page).to have_content("8")
    end
  end
end 
