require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many :mechanic_rides }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end
    before :each do 
      @park_1 = AmusementPark.create(name: "Park 1", admission_cost: 5)
      @mechanic_1 = Mechanic.create!(name: "Mechanic 1", experience: 12)
      @ride_2 = @mechanic_1.rides.create!(name: "Ride 2", thrill_rating: 2, open: true, amusement_park_id: @park_1.id)
      @ride_1 = @mechanic_1.rides.create!(name: "Ride 1", thrill_rating: 1, open: true, amusement_park_id: @park_1.id)
      @ride_5 = @mechanic_1.rides.create!(name: "Ride 5", thrill_rating: 5, open: true, amusement_park_id: @park_1.id)
      @ride_3 = @mechanic_1.rides.create!(name: "Ride 3", thrill_rating: 3, open: false, amusement_park_id: @park_1.id)
      @ride_4 = @mechanic_1.rides.create!(name: "Ride 4", thrill_rating: 4, open: true, amusement_park_id: @park_1.id)
    end 

  describe "#class_methods" do 
    it '.only_open' do 
      expect(Ride.only_open).to eq([@ride_2, @ride_1, @ride_5, @ride_4])
    end 

    it '.thrill_desc' do 
      expect(Ride.thrill_desc).to eq([@ride_5, @ride_4, @ride_3, @ride_2, @ride_1])
    end 
  end 
end
