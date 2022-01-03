require 'rails_helper'

RSpec.describe 'mechanics show page' do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: "Bob", years_experience: 10)
    @mechanic_2 = Mechanic.create!(name: "Pam", years_experience: 14)
    @mechanic_3 = Mechanic.create!(name: "Michael", years_experience: 3)

    @amusement_park = AmusementPark.create!(name: "Dizzy Kingdom", admission_cost: 50)

    @ride_1 = @amusement_park.rides.create!(name: "Stomach Churner", thrill_rating: 11, open: true)
    @ride_2 = @amusement_park.rides.create!(name: "Speedy Thingy", thrill_rating: 8, open: true)
    @ride_3 = @amusement_park.rides.create!(name: "Kids Land", thrill_rating: 2, open: true)
    @ride_4 = @amusement_park.rides.create!(name: "Non-thrilling Closed Ride", thrill_rating: 10, open: false)

    RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mechanic_1.id)
    RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mechanic_2.id)

    RideMechanic.create!(ride_id: @ride_2.id, mechanic_id: @mechanic_2.id)

    RideMechanic.create!(ride_id: @ride_3.id, mechanic_id: @mechanic_1.id)
    RideMechanic.create!(ride_id: @ride_3.id, mechanic_id: @mechanic_2.id)
    RideMechanic.create!(ride_id: @ride_3.id, mechanic_id: @mechanic_3.id)

    RideMechanic.create!(ride_id: @ride_4.id, mechanic_id: @mechanic_1.id)

    visit "/mechanics/#{@mechanic_1.id}"
  end

  describe 'when I visit a mechanic show page' do
    it 'displays their name and years of experience, and the names of rides they work on' do
      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.years_experience)
      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_3.name)

      expect(page).to_not have_content(@ride_2.name)
    end

    it 'displays only the rides that are open' do
      expect(page).to_not have_content(@ride_4.name)
    end

    it 'lists the rides by thrill rating in descending order' do
      expect(@ride_1.name).to appear_before(@ride_3.name)
    end

    it 'has a section to Add a ride to workload' do
      expect(page).to have_content("Add a ride to workload:")
    end


    it 'has a form to add a ride to their workload' do
      fill_in 'Ride Name', with: 'Speedy Thingy'
      click_button 'Submit'

      expect(page).to have_current_path("/mechanics/#{@mechanic_1.id}")
      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.years_experience)

      expect(@ride_1.name).to appear_before(@ride_2.name)
      expect(@ride_2.name).to appear_before(@ride_3.name)
    end

    # it 'I can add an existing ride and hit submit and am taken back to the age and can see the newly added ride' do
    #
    # end
  end
end
