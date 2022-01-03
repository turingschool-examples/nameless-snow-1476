require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:ride_mechanics) }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  describe 'class_methods' do
    before(:each) do
      @amusement_park_1 = AmusementPark.create!(name: 'Elitches', admission_cost: 30)
      @ride_1 = @amusement_park_1.rides.create!(name: 'Tower of Doom', thrill_rating: 10, open: true)
      @ride_2 = @amusement_park_1.rides.create!(name: 'Ding Dong Dock', thrill_rating: 2, open: true)
      @ride_3 = @amusement_park_1.rides.create!(name: 'Boomerang', thrill_rating: 7, open: true)
      @ride_4 = @amusement_park_1.rides.create!(name: 'Mind Eraser', thrill_rating: 8, open: false)
      @ride_5 = @amusement_park_1.rides.create!(name: 'Woo', thrill_rating: 4, open: true)
    end

    describe '::by_thrill_desc' do
      it 'orders rides by thrill rating, most thrills first' do
        expect(Ride.by_thrill_desc).to eq([@ride_1, @ride_4, @ride_3, @ride_5, @ride_2])
      end
    end
  end
end
