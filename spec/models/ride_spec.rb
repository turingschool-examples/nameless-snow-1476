require 'rails_helper'

RSpec.describe Ride do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :thrill_rating}

    ## Below: Do not know how to validate boolean for false. How do you do that?
    # it {should validate_presence_of :open}
  end


  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it {should have_many :ride_mechanics}
    it {should have_many(:mechanics).through(:ride_mechanics)}
  end

  describe 'model methods' do

    it '#open_rides' do
      amusement_park_1 = AmusementPark.create!(name: 'amusement_park_1', admission_cost: 1)

      ride1 = amusement_park_1.rides.create!(name: 'ride1', thrill_rating:1, open: true)
      ride2 = amusement_park_1.rides.create!(name: 'ride2', thrill_rating:2, open: false)
      ride3 = amusement_park_1.rides.create!(name: 'ride3', thrill_rating:3, open: true)
      
      expect(Ride.open_rides).to eq([ride1, ride3])
    end
  end
end
