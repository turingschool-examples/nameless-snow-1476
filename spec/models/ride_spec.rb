require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it {should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  it '#thrill_order' do
    elitch = AmusementPark.create!(name: 'Elitches', admission_cost: 5)
    seth = Mechanic.create!(name: 'Seth', years_experience: 1)
    joe = Mechanic.create!(name: 'Joe', years_experience: 2)
    ride_1 = Ride.create!(name: 'Ride 1', thrill_rating: 1, open: true, amusement_park_id: elitch.id)
    ride_2 = Ride.create!(name: 'Ride 2', thrill_rating: 2, open: true, amusement_park_id: elitch.id)
    ride_3 = Ride.create!(name: 'Ride 3', thrill_rating: 3, open: false, amusement_park_id: elitch.id)
    expect(Ride.thrill_order).to eq([ride_3, ride_2, ride_1])
  end
end
