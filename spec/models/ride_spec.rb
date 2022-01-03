require 'rails_helper'

RSpec.describe Ride do
  before(:each) do
    @amusement_park = AmusementPark.create!(name: "Dizzy Kingdom", admission_cost: 50)

    @ride_3 = @amusement_park.rides.create!(name: "Kids Land", thrill_rating: 2, open: true)
    @ride_1 = @amusement_park.rides.create!(name: "Stomach Churner", thrill_rating: 11, open: true)
    @ride_2 = @amusement_park.rides.create!(name: "Speedy Thingy", thrill_rating: 8, open: true)
    @ride_4 = @amusement_park.rides.create!(name: "Non-thrilling Closed Ride", thrill_rating: 10, open: false)
  end
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:ride_mechanics) }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  describe '::search' do
    it 'returns the ride based on a name string search' do
      expect(Ride.search_rides_by_name("Speedy Thingy")).to include(@ride_2)
    end
  end
end
