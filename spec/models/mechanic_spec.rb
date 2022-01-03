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
end
