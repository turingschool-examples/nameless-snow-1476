require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  before :each do
    @greg = Mechanic.create!(name: "Greg", years_experience: 6)
    @mary = Mechanic.create!(name: "Mary", years_experience: 8)
    @jones = Mechanic.create!(name: "Jones", years_experience: 16)
  end

  describe 'class methods' do
    it 'can calculate the average experience of mechanics' do
      expect(Mechanic.average_experience).to eq(10)
    end
  end
end
