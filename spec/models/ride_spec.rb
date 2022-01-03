require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:ride_mechanics) }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  describe "class methods" do
    let!(:park_1) {AmusementPark.create!(name: '7 Flags', admission_cost: 50)}
    let!(:ride_1) {park_1.rides.create!(name: 'Funny Bugs', thrill_rating: 5, open:true )}
    let!(:ride_2) {park_1.rides.create!(name: 'The Wiggler', thrill_rating: 10, open:true )}
    let!(:ride_3) {park_1.rides.create!(name: 'The Squiggler', thrill_rating: 8, open:false )}
    let!(:mech_1) {ride_1.mechanics.create!(name: 'Billy Mechs', years_experience:5)}
    let!(:mech_2) {ride_1.mechanics.create!(name: 'Susy Mechs', years_experience:10)}
    let!(:ride_mech_1) {RideMechanic.create!(ride_id: ride_2.id, mechanic_id: mech_1.id)}

    it "orders open rides by thrill highest to lowest" do
      expect(Ride.order_thrill_and_open).to eq([ride_2.name, ride_1.name])
    end
  end
end
