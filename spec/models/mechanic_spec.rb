require 'rails_helper'

RSpec.describe Mechanic do

  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'John Doe', years_experience: 20)
    @mechanic_2 = Mechanic.create!(name: 'Sam', years_experience: 5)
    @mechanic_3 = Mechanic.create!(name: 'Name Example', years_experience: 75)
  end

  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'self.average_experience' do
    it 'should return the average years of experience for all mechanics' do
      expect(Mechanic.average_experience).to eq(33)
    end
  end
  
end
