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

  let!(:mechanic_1) { Mechanic.create!(name: 'name_1', years_experience: 1) }
  let!(:mechanic_2) { Mechanic.create!(name: 'name_2', years_experience: 2) }
  let!(:mechanic_3) { Mechanic.create!(name: 'name_3', years_experience: 4) }

  describe 'class methods' do
    describe '::avg_years' do
      it 'should return the average number of years for all mechanics' do
        expected = (mechanic_1.years_experience + mechanic_2.years_experience + mechanic_3.years_experience) / 3.0

        expect(Mechanic.avg_years).to eq(expected.round(2))
      end
    end
  end
end