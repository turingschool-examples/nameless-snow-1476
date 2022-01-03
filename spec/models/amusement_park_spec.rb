require 'rails_helper'

RSpec.describe AmusementPark do

  before(:each) do
    @amusement_park = AmusementPark.create!(name: 'Elitches', admission_cost: 90)
    @ride_1 = Ride.create!(name: 'Roller Coaster', thrill_rating: 4, open: true, amusement_park_id: @amusement_park.id)
    @ride_2 = Ride.create!(name: 'Another Ride', thrill_rating: 2, open: false, amusement_park_id: @amusement_park.id)
    @ride_3 = Ride.create!(name: 'Brand New Ride', thrill_rating: 5, open: true, amusement_park_id: @amusement_park.id)
  end

  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe '#rides_by_name' do
    it 'returns rides for an amusement park by name' do
      expect(@amusement_park.rides_by_name).to eq([@ride_2, @ride_3, @ride_1])
    end
  end

end
