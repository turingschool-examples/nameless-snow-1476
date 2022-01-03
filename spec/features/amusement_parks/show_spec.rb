require 'rails_helper'

RSpec.describe 'amusement park show page', type: :feature do
  let!(:ap_1) { AmusementPark.create!(name: 'ap_1', admission_cost: 1) }
  let!(:ap_2) { AmusementPark.create!(name: 'ap_2', admission_cost: 2) }
  let!(:mechanic_1) { Mechanic.create!(name: 'name_1', years_experience: 1) }
  
  let!(:ride_1) { ap_1.rides.create!(name: 'ride_1', thrill_rating: 1, open: true, mechanics: [mechanic_1]) }
  let!(:ride_2) { ap_1.rides.create!(name: 'ride_2', thrill_rating: 2, open: false, mechanics: [mechanic_1]) }
  let!(:ride_3) { ap_1.rides.create!(name: 'ride_3', thrill_rating: 3, open: true, mechanics: [mechanic_1]) }
  let!(:ride_4) { ap_1.rides.create!(name: 'ride_4', thrill_rating: 4, open: true) }
  let!(:ride_5) { ap_2.rides.create!(name: 'ride_5', thrill_rating: 5, open: true) }
  
  before(:each) { visit amusement_park_path(ap_1) }

  describe 'view elements' do
    it 'has a header with name of park' do
      expect(page).to have_css("h1", text: "#{ap_1.name} Show Page")
    end

    it 'displays the admissions price' do
      expect(page).to have_content("Admissions: $#{ap_1.admission_cost}.00")
    end

    it 'displays list of the park rides' do
      expect(page).to have_content(ride_1.name)
      expect(page).to have_content(ride_2.name)
      expect(page).to have_content(ride_3.name)
      expect(page).to have_content(ride_4.name)
      expect(page).to have_no_content(ride_5.name)
    end

    it 'displays the list of park rides in alphabetical order' do
      expect(ride_1.name).to appear_before(ride_2.name)
      expect(ride_1.name).to appear_before(ride_3.name)
      expect(ride_1.name).to appear_before(ride_4.name)
      expect(ride_2.name).to appear_before(ride_3.name)
      expect(ride_2.name).to appear_before(ride_4.name)
      expect(ride_3.name).to appear_before(ride_4.name)
    end

    it 'displays the average thrill rating of the rides' do
      expect(page).to have_content("Average Thrill Rating of Rides: #{ap_1.avg_thrill}")
    end
  end
end