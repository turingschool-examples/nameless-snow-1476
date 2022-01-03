require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'class methods' do
    before(:each) do
      @mechanic_1 = Mechanic.create!(name: 'George Everett', years_experience: 5)
      @mechanic_2 = Mechanic.create!(name: 'Max Jonson', years_experience: 4)
      @mechanic_3 = Mechanic.create!(name: 'Lorinda Smith', years_experience: 13)
      @mechanic_4 = Mechanic.create!(name: 'Maria Grace', years_experience: 8)
    end

    describe '::average_years' do
      it 'calculates the average years of experience across all mechanics' do
        expect(Mechanic.average_years).to eq(7.5)
      end
    end
  end

  describe 'instance_methods' do
    before(:each) do
      @mechanic_1 = Mechanic.create!(name: 'George Everett', years_experience: 5)
      @mechanic_2 = Mechanic.create!(name: 'Max Jonson', years_experience: 4)
      @mechanic_3 = Mechanic.create!(name: 'Lorinda Smith', years_experience: 13)
      @mechanic_4 = Mechanic.create!(name: 'Maria Grace', years_experience: 8)

      @amusement_park_1 = AmusementPark.create!(name: 'Elitches', admission_cost: 30)

      @ride_1 = @amusement_park_1.rides.create!(name: 'Tower of Doom', thrill_rating: 10, open: true)
      @ride_2 = @amusement_park_1.rides.create!(name: 'Ding Dong Dock', thrill_rating: 2, open: true)
      @ride_3 = @amusement_park_1.rides.create!(name: 'Boomerang', thrill_rating: 7, open: true)
      @ride_4 = @amusement_park_1.rides.create!(name: 'Mind Eraser', thrill_rating: 8, open: false)
      @ride_5 = @amusement_park_1.rides.create!(name: 'Woo', thrill_rating: 4, open: true)

      @ride_1.mechanics << @mechanic_1
      @ride_2.mechanics << @mechanic_1
      @ride_3.mechanics << @mechanic_1
      @ride_4.mechanics << @mechanic_1
    end

    describe '#open_rides' do
      it 'lists the rides that are open that a mechanic is working on' do
        expect(@mechanic_1.open_rides).to eq([@ride_1, @ride_2, @ride_3])
      end
    end
  end
end
