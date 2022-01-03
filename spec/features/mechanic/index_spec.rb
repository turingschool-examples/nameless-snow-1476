require 'rails_helper'

RSpec.describe 'mechanic index page' do 
  before :each do 
    @mechanic_1 = Mechanic.create!(name: "Mechanic 1", experience: 12)
    @mechanic_2 = Mechanic.create!(name: "Mechanic 2", experience: 15)
  
    visit "/mechanics"
  end 
  describe 'when i visit the mechanics index page' do 
    it 'has a header and mechanics attributes' do 
      expect(current_path).to eq("/mechanics")

      expect(page).to have_content("All Mechanics")
      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.experience)
      expect(page).to have_content(@mechanic_2.name)
      expect(page).to have_content(@mechanic_2.experience)
    end 

    it 'has average years of experience across all mechanics' do 

      expect(page).to have_content("Average years of experience: 13.5")
    end 
  end 
end 