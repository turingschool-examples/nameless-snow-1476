require 'rails_helper'

RSpec.describe 'mechanic show page', type: :feature do
  let!(:ap_1) { AmusementPark.create!(name: 'ap_1', admission_cost: 1) }
  let!(:mechanic_1) { Mechanic.create!(name: 'name_1', years_experience: 1) }
  
  let!(:ride_1) { ap_1.rides.create!(name: 'ride_1', thrill_rating: 1, open: true, mechanics: [mechanic_1]) }
  let!(:ride_2) { ap_1.rides.create!(name: 'ride_2', thrill_rating: 2, open: false, mechanics: [mechanic_1]) }
  let!(:ride_3) { ap_1.rides.create!(name: 'ride_3', thrill_rating: 3, open: true, mechanics: [mechanic_1]) }
  let!(:ride_4) { ap_1.rides.create!(name: 'ride_4', thrill_rating: 4, open: true) }

  before(:each) { visit mechanic_path(mechanic_1) }

  describe 'as user' do
    describe 'view elements' do
      it 'displays mechanic name, years experience' do
        expect(page).to have_content(mechanic_1.name)
        expect(page).to have_content(mechanic_1.years_experience)
      end 
    end
  end
end