require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @hurler = @six_flags.rides.create!(name: 'Hurler', thrill_rating: 10, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 5, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 15, open: false)

  end

  describe 'instance methods' do
    it '#ordered_rides' do
      expect(@six_flags.ordered_rides).to eq([@ferris, @hurler, @scrambler])
    end

    it '#average_thrill_rating' do
      expect(@six_flags.average_thrill_rating).to eq(10)
    end
  end
end
