require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :years_experience }
  end

  let!(:ap_1) { AmusementPark.create!(name: 'ap_1', admission_cost: 1) }

  let!(:mechanic_1) { Mechanic.create!(name: 'name_1', years_experience: 1) }
  let!(:mechanic_2) { Mechanic.create!(name: 'name_2', years_experience: 2) }
  let!(:mechanic_3) { Mechanic.create!(name: 'name_3', years_experience: 4) }

  let!(:ride_1) { ap_1.rides.create!(name: 'ride_1', thrill_rating: 1, open: true, mechanics: [mechanic_1]) }
  let!(:ride_2) { ap_1.rides.create!(name: 'ride_2', thrill_rating: 2, open: false, mechanics: [mechanic_1]) }
  let!(:ride_3) { ap_1.rides.create!(name: 'ride_3', thrill_rating: 3, open: true, mechanics: [mechanic_1, mechanic_2]) }
  let!(:ride_4) { ap_1.rides.create!(name: 'ride_4', thrill_rating: 4, open: true, mechanics: [mechanic_2, mechanic_3]) }

  describe 'class methods' do
    describe '::avg_years' do
      it 'should return the average number of years for all mechanics' do
        expected = (mechanic_1.years_experience + mechanic_2.years_experience + mechanic_3.years_experience) / 3.0

        expect(Mechanic.avg_years).to eq(expected.round(2))
      end
    end
  end 

  describe 'instance methods' do
    describe '#open_rides' do
      it 'should return mechanics list of open rides' do
        expect(mechanic_1.open_rides).to eq([ride_1, ride_3])
      end
    end
  end
end