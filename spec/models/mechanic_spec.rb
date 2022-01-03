require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many :rides }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :years_experience }
  end

  describe 'class methods' do
    before(:each) do
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

      @ride_1 = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 10, open: true)
      @ride_2 = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @ride_3 = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: true)
    end

    it '#sort_thrill_rating' do #Years of Experience
      expect(Ride.sort_thrill_rating).to eq([@ride_1, @ride_3, @ride_2])
    end
  end
end
