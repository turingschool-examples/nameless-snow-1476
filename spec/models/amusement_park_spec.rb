require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'instance methods' do
    before(:each) do
      @park = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
      @ride = @park.rides.create!(name: "Frog Hopper", thrill_rating: 7, open: true)
      @ride2 = @park.rides.create!(name: "Fahrenheit", thrill_rating: 6, open: false)
      @ride3 = @park.rides.create!(name: "Fruit Splash", thrill_rating: 5, open: true)
      @ride4 = @park.rides.create!(name: "Twister", thrill_rating: 8, open: true)
    end

    describe 'alpha_rides' do
      it 'lists rides in alphabetical order' do
        expect(@park.alpha_rides).to eq([@ride2, @ride, @ride3, @ride4])
      end
    end

    describe 'avg_ride_thrill' do
      it 'shows average thrill rating for all rides' do
        expect(@park.avg_ride_thrill).to eq(6)
      end
    end
  end

end
