require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  let!(:wonder_wharf) {AmusementPark.create!(name: "Wonder Wharf", admission_cost: 3)}

  let(:merry_go_round) {Ride.create!(name: "Happy Whale", thrill_rating: 3, open: true, amusement_park: wonder_wharf)}
  let(:coaster) {Ride.create!(name: "Whirly Whale", thrill_rating: 8, open: true, amusement_park: wonder_wharf)}
  let(:bumper_cars) {Ride.create!(name: "Bumpy Whale", thrill_rating: 6, open: true, amusement_park: wonder_wharf)}
  let(:haunted_house) {Ride.create!(name: "Ghost Whale", thrill_rating: 7, open: false, amusement_park: wonder_wharf)}
  let(:skating_rink) {Ride.create!(name: "Frozen Whale", thrill_rating: 5, open: false, amusement_park: wonder_wharf)}

  describe '#rides_alpha' do
    it 'returns all rides in park in alphabetical order by name' do
      expect(wonder_wharf.rides_alpha).to eq([bumper_cars, skating_rink, haunted_house, merry_go_round, coaster])
    end
  end
end
