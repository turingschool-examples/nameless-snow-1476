require 'rails_helper'

RSpec.describe Ride do

  before(:each) do
    @amusement_park = AmusementPark.create!(name: 'Elitches', admission_cost: 90)
    @ride_1 = Ride.create!(name: 'Roller Coaster', thrill_rating: 4, open: true, amusement_park_id: @amusement_park.id)
    @ride_2 = Ride.create!(name: 'Another Ride', thrill_rating: 2, open: false, amusement_park_id: @amusement_park.id)
    @ride_3 = Ride.create!(name: 'Brand New Ride', thrill_rating: 5, open: true, amusement_park_id: @amusement_park.id)
  end

  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanic_rides) }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  describe '::average_thrill_rating' do
    it 'returns the average thrill rating of a collection of rides' do
      expect(Ride.average_thrill_rating).to eq(3.67)
    end
  end
end
