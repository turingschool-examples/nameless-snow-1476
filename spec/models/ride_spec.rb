require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanic_rides) }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end
  describe '::open_and_thrilling' do
    it 'orders rides by most thrilling and only shows the ones open' do
      amusement_park = AmusementPark.create!(name: 'Lakeside', admission_cost: 2)
      ride_1 = amusement_park.rides.create!(name: 'hurricane', thrill_rating: 5, open: true)
      ride_2 = amusement_park.rides.create!(name: 'cyclone', thrill_rating: 7, open: true)
      ride_3 = amusement_park.rides.create!(name: 'bumper cars', thrill_rating: 2, open: true)
      ride_4 = amusement_park.rides.create!(name: 'matterhorn', thrill_rating: 10, open: false)
      actual = Ride.open_and_thrilling
      expected = [ride_2, ride_1, ride_3]
      expect(actual).to eq(expected)
    end
  end
end
