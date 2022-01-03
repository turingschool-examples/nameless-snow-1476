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
        expect(self.average_years).to eq(7.5)
      end
    end
  end
end
