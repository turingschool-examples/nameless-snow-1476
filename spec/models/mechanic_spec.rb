require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'class methods' do
    before(:each) do
      @mechanic = Mechanic.create!(name: "Kara Smith", years_experience: 11)
      @mechanic2 = Mechanic.create!(name: "Jeff Burton", years_experience: 8)
      @mechanic3 = Mechanic.create(name: "Taylor Jennings", years_experience: 3)
    end

    describe 'average_experience' do
      it 'averages years_experience for all mechanics' do
        expect(Mechanic.average_experience).to eq(7)
      end
    end
  end

  describe 'instance methods' do
    before(:each) do
      @park = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
      @ride = @park.rides.create!(name: "Frog Hopper", thrill_rating: 7, open: true)
      @ride2 = @park.rides.create!(name: "Fahrenheit", thrill_rating: 6, open: false)
      @ride3 = @park.rides.create!(name: "Fruit Splash", thrill_rating: 5, open: true)
      @ride4 = @park.rides.create!(name: "Twister", thrill_rating: 8, open: true)
      @mechanic = Mechanic.create!(name: "Kara Smith", years_experience: 11)
      @mechanic2 = Mechanic.create!(name: "Jeff Burton", years_experience: 8)
      @mechanic3 = Mechanic.create(name: "Taylor Jennings", years_experience: 3)
      @mechanic.rides << @ride
      @mechanic.rides << @ride2
      @mechanic.rides << @ride3
    end

    describe 'open_rides' do
      it 'shows open rides in desc order of thrill rating' do
        expect(@mechanic.open_rides).to eq([@ride, @ride3])
      end
    end
  end
end
