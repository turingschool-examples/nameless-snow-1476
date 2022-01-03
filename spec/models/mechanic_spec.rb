require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
    describe '::average_of_exp' do
      it 'lists the average of years_experience' do
        mech_1 = Mechanic.create!(name: 'Tom', years_experience: 5)
        mech_1 = Mechanic.create!(name: 'Tom_2', years_experience: 3)
        mech_1 = Mechanic.create!(name: 'Tom_3', years_experience: 2)
        actual = Mechanic.average_of_exp
        expected = 3
        expect(actual).to eq(expected)
      end
    end
  end
end
