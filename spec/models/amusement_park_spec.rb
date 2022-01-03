require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :admission_cost }
  end

  let!(:ap_1) { AmusementPark.create!(name: 'ap_1', admission_cost: 1) }
  let!(:ap_2) { AmusementPark.create!(name: 'ap_2', admission_cost: 2) }
  let!(:mechanic_1) { Mechanic.create!(name: 'name_1', years_experience: 1) }
  
  let!(:ride_1) { ap_1.rides.create!(name: 'ride_1', thrill_rating: 1, open: true, mechanics: [mechanic_1]) }
  let!(:ride_2) { ap_1.rides.create!(name: 'ride_2', thrill_rating: 2, open: false, mechanics: [mechanic_1]) }
  let!(:ride_3) { ap_1.rides.create!(name: 'ride_3', thrill_rating: 3, open: true, mechanics: [mechanic_1]) }
  let!(:ride_4) { ap_1.rides.create!(name: 'ride_4', thrill_rating: 4, open: true) }
  let!(:ride_5) { ap_2.rides.create!(name: 'ride_5', thrill_rating: 5, open: true) }
  let!(:ride_6) { ap_2.rides.create!(name: 'a_ride_5', thrill_rating: 6, open: true) }

  describe 'instance methods' do
    describe '#rides_alphabetical' do
      it 'should return the rides in alphabetical order' do
        expect(ap_2.rides_alphabetical).to eq([ride_6, ride_5])
      end
    end

    describe '#avg_thrill' do
      it 'should return the average thrill rating of parks rides' do
        expect(ap_1.avg_thrill).to eq(2.5)
      end
    end
  end
end
