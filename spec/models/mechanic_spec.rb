require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  let!(:wonder_wharf) {AmusementPark.create!(name: "Wonder Wharf", admission_cost: 3)}

  let(:merry_go_round) {Ride.create!(name: "Happy Whale", thrill_rating: 3, open: true, amusement_park: wonder_wharf)}
  let(:coaster) {Ride.create!(name: "Whirly Whale", thrill_rating: 8, open: true, amusement_park: wonder_wharf)}
  let(:bumper_cars) {Ride.create!(name: "Bumpy Whale", thrill_rating: 6, open: true, amusement_park: wonder_wharf)}
  let(:haunted_house) {Ride.create!(name: "Ghost Whale", thrill_rating: 7, open: false, amusement_park: wonder_wharf)}
  let(:skating_rink) {Ride.create!(name: "Frozen Whale", thrill_rating: 5, open: false, amusement_park: wonder_wharf)}

  let!(:teddy) {Mechanic.create!(name: "Teddy Handyman", years_of_experience: 23)}
  let!(:bob) {Mechanic.create!(name: "Bob Belcher", years_of_experience: 3)}
  let!(:jim) {Mechanic.create!(name: "Jim Redman", years_of_experience: 35)}

  describe '::average_exp' do
    it 'calculates the average years of experience for all mechanics' do
      expect(Mechanic.average_exp).to eq(20.33)
    end
  end

  describe '#only_open' do
    it 'returns only rides that are open' do
      RideMechanic.create!(ride: merry_go_round, mechanic: teddy)
      RideMechanic.create!(ride: coaster, mechanic: teddy)
      RideMechanic.create!(ride: skating_rink, mechanic: teddy)

      RideMechanic.create!(ride: bumper_cars, mechanic: bob)
      RideMechanic.create!(ride: coaster, mechanic: bob)

      RideMechanic.create!(ride: haunted_house, mechanic: jim)

      expect(teddy.only_open).to eq([merry_go_round, coaster])
      expect(bob.only_open).to eq([bumper_cars, coaster])
      expect(jim.only_open).to eq([])
    end
  end
end
