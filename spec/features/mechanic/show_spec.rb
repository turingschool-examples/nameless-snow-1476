require 'rails_helper'

RSpec.describe 'mechanic show page' do 
  before :each do 
    @park_1 = AmusementPark.create(name: "Park 1", admission_cost: 5)
    
    @mechanic_1 = Mechanic.create!(name: "Mechanic 1", experience: 12)
    
    @ride_2 = @mechanic_1.rides.create!(name: "Ride 2", thrill_rating: 2, open: true, amusement_park_id: @park_1.id)
    @ride_5 = @mechanic_1.rides.create!(name: "Ride 5", thrill_rating: 5, open: true, amusement_park_id: @park_1.id)
    @ride_3 = @mechanic_1.rides.create!(name: "Ride 3", thrill_rating: 3, open: false, amusement_park_id: @park_1.id)
    @ride_4 = @mechanic_1.rides.create!(name: "Ride 4", thrill_rating: 4, open: true, amusement_park_id: @park_1.id)
    @ride_1 = @mechanic_1.rides.create!(name: "Ride 1", thrill_rating: 1, open: true, amusement_park_id: @park_1.id)

    visit "/mechanics/#{@mechanic_1.id}"
  end 

  describe 'when i visit the mechanics show page' do 
    it 'has a mechanics attributes and the names of rides they/re working on' do 
      expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")

      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.experience)
      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_2.name)
    end 

    it 'shows rides that are only open' do 

      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_2.name)
      expect(page).to have_content(@ride_4.name)
      expect(page).to have_content(@ride_5.name)
      expect(page).to_not have_content(@ride_3.name)
    end 

    it 'is organized by thrill rating (descending)' do 
      expect(@ride_5.name).to appear_before(@ride_4.name)
      expect(@ride_4.name).to appear_before(@ride_2.name)
      expect(@ride_2.name).to appear_before(@ride_1.name)
    end
  end 

  describe 'add a ride form' do 
    describe 'when i visit the mechanics show page' do 
      it 'has a form to add a ride to their workload' do
        expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")
        expect(page).to have_content("Add a ride to workload:")

        fill_in :id, with: 682
        click_button "Submit"

        expect(page).to have_content("Ride Id: 1044")
      end  
    end 
  end 
end 