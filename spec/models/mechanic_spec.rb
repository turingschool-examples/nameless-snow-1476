require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end


  before :each do
    @mechanic_1 = Mechanic.create!(name: 'Joe', years_experience: 5)
    @mechanic_2 = Mechanic.create!(name: 'Alan', years_experience: 10)
    @mechanic_3 = Mechanic.create!(name: 'Barb', years_experience: 15)

    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: false)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 8, open: false)
    @tumbler = @six_flags.rides.create!(name: 'Tumbler', thrill_rating: 5, open: true)
    @washer = @six_flags.rides.create!(name: 'Washer', thrill_rating: 10, open: true)

    @ride_mechanic_1 = RideMechanic.create!(ride_id: @hurler.id, mechanic_id: @mechanic_1.id)
    @ride_mechanic_2 = RideMechanic.create!(ride_id: @scrambler.id, mechanic_id: @mechanic_1.id)
    @ride_mechanic_3 = RideMechanic.create!(ride_id: @ferris.id, mechanic_id: @mechanic_1.id)
    @ride_mechanic_4 = RideMechanic.create!(ride_id: @tumbler.id, mechanic_id: @mechanic_1.id)
  end

  describe 'class methods' do
    it '::avg_years_exp' do
      expected = Mechanic.avg_years_exp

      expect(expected).to eq(10)
    end
  end

  describe 'instance methods' do
    it '#open_rides' do
      expect(@mechanic_1.open_rides).to eq([@hurler, @tumbler])
    end

    it '#add_ride' do
      @mechanic_1.add_ride(@washer.id)

      expect(@mechanic_1.open_rides).to eq([@washer, @hurler, @tumbler])
    end
  end


end
