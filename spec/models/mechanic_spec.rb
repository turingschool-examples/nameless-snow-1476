require 'rails_helper'

describe Mechanic do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'class methods' do
    describe '::average_experience' do
      it 'returns average years experience for all mechanics' do
        @mechanic1 = Mechanic.create!(name: 'Kara Smith', years_experience: 20)
        @mechanic2 = Mechanic.create!(name: 'Sam Jones', years_experience: 10)
        @mechanics = Mechanic.all

        expect(@mechanics.average_experience).to eq(15)
      end
    end 
  end
end