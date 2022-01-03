require 'rails_helper'

RSpec.describe Mechanic do
  before(:each) do
    @mechanic_1 = Mechanic.create(name: "Bob", years_experience: 10)
    @mechanic_2 = Mechanic.create(name: "Pam", years_experience: 14)
    @mechanic_3 = Mechanic.create(name: "Michael", years_experience: 3)

    @amusement_park = AmusementPark.create!(name: "Dizzy Kingdom", admission_cost: 50)

    @ride_3 = @amusement_park.rides.create!(name: "Kids Land", thrill_rating: 2, open: true)
    @ride_1 = @amusement_park.rides.create!(name: "Stomach Churner", thrill_rating: 11, open: true)
    @ride_2 = @amusement_park.rides.create!(name: "Speedy Thingy", thrill_rating: 8, open: true)
    @ride_4 = @amusement_park.rides.create!(name: "Non-thrilling Closed Ride", thrill_rating: 10, open: false)

    RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mechanic_1.id)
    RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mechanic_2.id)

    RideMechanic.create!(ride_id: @ride_2.id, mechanic_id: @mechanic_2.id)

    RideMechanic.create!(ride_id: @ride_3.id, mechanic_id: @mechanic_1.id)
    RideMechanic.create!(ride_id: @ride_3.id, mechanic_id: @mechanic_2.id)
    RideMechanic.create!(ride_id: @ride_3.id, mechanic_id: @mechanic_3.id)

    RideMechanic.create!(ride_id: @ride_4.id, mechanic_id: @mechanic_1.id)

  end
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics)}
  end

  describe '::experience' do
    it 'returns the average years of experience of all mechanics' do
      expect(Mechanic.experience).to eq(9)
    end
  end

  describe '#open_rides' do
    it 'only returns a list of rides which are open and organized by thrill level' do
      expect(@mechanic_1.open_rides).to eq([@ride_1, @ride_3])
    end
  end
end
