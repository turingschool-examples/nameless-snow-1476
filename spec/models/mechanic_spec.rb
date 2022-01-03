require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many :mechanic_rides }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  before :each do 
    @mechanic_1 = Mechanic.create!(name: "Mechanic 1", experience: 12)
    @mechanic_2 = Mechanic.create!(name: "Mechanic 2", experience: 15)
  end 

  describe '#class_methods' do 
    it 'average_experience' do 
      expect(Mechanic.average_experience).to eq(13.5)
    end 
  end 
end