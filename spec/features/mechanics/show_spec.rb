require 'rails_helper'

describe 'Mechanic Show' do
  before do
    park = AmusementPark.create(name: 'Hug Land', admission_cost: 1000)
    @mechanic1 = Mechanic.create(name: 'Kara Smith', years_experience: 11)
    @mechanic2 = Mechanic.create(name: 'Sam Jones', years_experience: 7)
    @ride1 = Ride.create(name: 'Ferris Wheel', thrill_rating: 3, open: true, amusement_park: park)
    @ride2 = Ride.create(name: 'Loop-D-Loop', thrill_rating: 10, open: true, amusement_park: park)
    @ride3 = Ride.create(name: 'Spin-E-Thing', thrill_rating: 6, open: false, amusement_park: park)
    @ride4 = Ride.create(name: 'Round-A-Bout', thrill_rating: 6, open: false, amusement_park: park)

    RideMechanic.create!(mechanic: @mechanic1, ride: @ride1)
    RideMechanic.create!(mechanic: @mechanic1, ride: @ride2)
    RideMechanic.create!(mechanic: @mechanic1, ride: @ride3)
    RideMechanic.create!(mechanic: @mechanic2, ride: @ride4)

    visit "/mechanics/#{@mechanic1.id}"
  end

  describe 'display' do
    it 'one mechanic name and years of experience' do
      expect(page).to have_content("Mechanic: #{@mechanic1.name}")
      expect(page).to have_content("Years of Experience: #{@mechanic1.years_experience}")
      expect(page).to_not have_content(@mechanic2)
    end

    it 'open rides which mechanic is working on, in thrill rate desc order' do
      expect(page).to have_content("Current rides they're working on:")
      expect(@ride2.name).to appear_before(@ride1.name)
    end
  end
end