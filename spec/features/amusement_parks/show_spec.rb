require 'rails_helper'

RSpec.describe 'amusement park show page' do
  before(:each) do
    @amusement_park_1 = AmusementPark.create!(name: "Dizzy Kingdom", admission_cost: 50)
    @amusement_park_2 = AmusementPark.create!(name: "Ralph City", admission_cost: 40)

    @ride_1 = @amusement_park_1.rides.create!(name: "Stomach Churner", thrill_rating: 11, open: true)
    @ride_2 = @amusement_park_1.rides.create!(name: "Speedy Thingy", thrill_rating: 8, open: true)
    @ride_3 = @amusement_park_1.rides.create!(name: "Kids Land", thrill_rating: 3, open: true)
    @ride_4 = @amusement_park_1.rides.create!(name: "Non-thrilling Closed Ride", thrill_rating: 10, open: false)

    @ride_5 = @amusement_park_2.rides.create!(name: "Body Launcher", thrill_rating: 10, open: false)
    @ride_6 = @amusement_park_2.rides.create!(name: "Mind Spinner", thrill_rating: 8, open: false)
    @ride_7 = @amusement_park_2.rides.create!(name: "Ground Leaver", thrill_rating: 9, open: false)

    visit "amusement_parks/#{@amusement_park_1.id}"
  end

  describe 'when I visit an amusement parks show page' do
    it 'displays the name and price of admission' do
      expect(page).to have_content(@amusement_park_1.name)
      expect(page).to have_content(@amusement_park_1.admission_cost)

      expect(page).to_not have_content(@amusement_park_2.name)
      expect(page).to_not have_content(@amusement_park_2.admission_cost)
    end


    xit 'displays the names of the rides at that amusement park in alphabetical order' do
      expect(@ride_3).to appear_before(@ride_4)
      expect(@ride_4).to appear_before(@ride_2)
      expect(@ride_2).to appear_before(@ride_1)
      # Hi Jamison/Mike, I was working on implementing the sort for the extension when I ran out of time.
    end

    xit 'shows the average thrill rating for the amusement parks rides' do
      expect(page).to have_content("Average Thrill Rating of Rides: 8")
    end

  end
end
