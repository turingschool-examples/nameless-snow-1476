require 'rails_helper'

describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:ride_mechanics) }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  describe 'class methodes' do
    describe '::filtered' do
      it 'filters only open rides and orders them desc by thrill rating' do
        park = AmusementPark.create(name: 'Hug Land', admission_cost: 1000)
        @mechanic1 = Mechanic.create(name: 'Kara Smith', years_experience: 11)
        @ride1 = Ride.create(name: 'Ferris Wheel', thrill_rating: 3, open: true, amusement_park: park)
        @ride2 = Ride.create(name: 'Loop-D-Loop', thrill_rating: 10, open: true, amusement_park: park)
        @ride3 = Ride.create(name: 'Spin-E-Thing', thrill_rating: 6, open: false, amusement_park: park)

        RideMechanic.create!(mechanic: @mechanic1, ride: @ride1)
        RideMechanic.create!(mechanic: @mechanic1, ride: @ride2)
        RideMechanic.create!(mechanic: @mechanic1, ride: @ride3)

        expect(@mechanic1.rides.filtered).to eq([@ride2, @ride1])
      end
    end

    describe '::average_thrill' do
      it 'returns average thrill rating for all rides' do
        @park = AmusementPark.create(name: 'Hug Land', admission_cost: 1000)
        @ride1 = @park.rides.create(name: 'Ferris Wheel', thrill_rating: 5, open: true)
        @ride2 = @park.rides.create(name: 'Loop-D-Loop', thrill_rating: 9, open: true)
        @ride3 = @park.rides.create(name: 'Spin-E-Thing', thrill_rating: 7, open: true)

        expect(@park.rides.average_thrill).to eq(7)
      end
    end

    describe '::alpha_sort' do
      it 'sorts all rides alphabetically' do
        @park = AmusementPark.create(name: 'Hug Land', admission_cost: 1000)
        @ride1 = @park.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
        @ride2 = @park.rides.create!(name: 'The Curler', thrill_rating: 4, open: true)
        @ride3 = @park.rides.create!(name: 'The Twirler', thrill_rating: 10, open: true)

        expect(@park.rides.alpha_sort).to eq([@ride2, @ride1, @ride3])
      end
    end
  end
end
