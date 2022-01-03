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

      it 'displays current rides they are working on and are open' do
        expect(page).to have_content(ride_1.name)
        expect(page).to have_no_content(ride_2.name)
        expect(page).to have_content(ride_3.name)
        expect(page).to have_no_content(ride_4.name)
      end

      it 'displays the current rides they are working on in most thrill order' do
        expect(ride_3.name).to appear_before(ride_1.name)
      end

      it 'displays a form with label Ride ID:' do
        expect(page).to have_css("label", text: 'Ride ID:')
      end

      it 'displays a submit button to add ride id' do
        expect(page).to have_button('Submit')
      end
    end

    describe 'clickable elements' do
      it 'adds a ride to the working on list after submitting ride id' do
        expect(page).to have_no_content(ride_4.name)

        fill_in 'Ride ID:', with: ride_4.id
        click_button 'Submit'

        expect(page).to have_current_path(mechanic_path(mechanic_1))
        expect(page).to have_content(ride_4.name)
      end
    end
  end
end