require 'rails_helper'

RSpec.describe Ride do

  before do
    @amusement_park = AmusementPark.create!(name: "park", admission_cost: 10)
    @ride1 = Ride.create!(name: "ride1", thrill_rating: 2, open: true, amusement_park_id: @amusement_park.id)
    @ride2 = Ride.create!(name: "ride2", thrill_rating: 8, open: false, amusement_park_id: @amusement_park.id)
    @ride3 = Ride.create!(name: "ride3", thrill_rating: 6, open: true, amusement_park_id: @amusement_park.id)
  end
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanics) }
    it { should have_many(:ride_mechanics) }
  end

  describe 'methods' do
    it '#open_rides' do
      expect(Ride.open_rides).to eq([@ride1, @ride3])
    end

    it '#thrill_rating' do
      expect(Ride.thrill_rating).to eq([@ride2, @ride3, @ride1])
    end
  end
end
