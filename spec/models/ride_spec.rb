require 'rails_helper'

RSpec.describe Ride do
  let!(:six_flags) {AmusementPark.create!(name: "Six Flags", admission_cost: 20)}

  let!(:splash) {six_flags.rides.create!(name: "Log Ride", thrill_rating: 3, open: true)}
  let!(:coaster) {six_flags.rides.create!(name: "Cyclone", thrill_rating: 5, open: true)}
  let!(:hot_dog) {six_flags.rides.create!(name: "Hot Dog Stand", thrill_rating: 1, open: false)}

  let!(:mechanic_1) {Mechanic.create!(name: "Ted", years_of_experience: 10, rides: [splash, coaster, hot_dog])}

  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanics) }
  end

  describe 'class methods' do
    it 'orders rides by thrill rating' do
      expect(Ride.most_to_least_thrilling).to eq([coaster, splash, hot_dog])
    end
  end
end
