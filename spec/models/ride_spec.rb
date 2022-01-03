require 'rails_helper'

RSpec.describe Ride do
  let!(:park_1) {AmusementPark.create!(name: 'Six Flags', admission_cost: 50 )}

  let!(:ride_1) {park_1.rides.create!(name: 'The Hurler', thrill_rating: 50, open: false)}
  let!(:ride_2) {park_1.rides.create!(name: 'The Swings', thrill_rating: 90, open: true)}
  let!(:ride_3) {park_1.rides.create!(name: 'Sea Dragon', thrill_rating: 60, open: true)}
  let!(:ride_4) {park_1.rides.create!(name: 'Haunted Mansion', thrill_rating: 100, open: true)}
  let!(:ride_5) {park_1.rides.create!(name: 'Indiana Jones', thrill_rating: 80, open: true)}

  let!(:mechanic_1) {Mechanic.create!(name: "Johnny", years_experience: 10)}
  let!(:mechanic_2) {Mechanic.create!(name: "BullFrog", years_experience: 20)}

  let!(:mech_ride_1) {RideMechanic.create!(mechanic: mechanic_1, ride: ride_1)}
  let!(:mech_ride_2) {RideMechanic.create!(mechanic: mechanic_1, ride: ride_2)}
  let!(:mech_ride_3) {RideMechanic.create!(mechanic: mechanic_2, ride: ride_3)}
  let!(:mech_ride_4) {RideMechanic.create!(mechanic: mechanic_1, ride: ride_4)}
  
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:ride_mechanics) } 
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'class methods' do 
    it 'lists rides by thrill rating in descending order' do 
      expect(Ride.thrill_order).to eq([ride_4, ride_2, ride_5, ride_3, ride_1])
    end

    it 'lists rides in alphabetical order' do 
      expect(Ride.alphabetical_order).to eq([ride_4, ride_5, ride_3, ride_1, ride_2])
    end

    it 'averages thrill rating of all rides' do 
      expect(Ride.average_thrill_rating).to eq(76)
    end
  end
end
