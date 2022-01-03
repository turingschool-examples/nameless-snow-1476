require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end


  before :each do
    @mechanic_1 = Mechanic.create!(name: 'Joe', years_experience: 5)
    @mechanic_2 = Mechanic.create!(name: 'Alan', years_experience: 10)
    @mechanic_3 = Mechanic.create!(name: 'Barb', years_experience: 15)
  end

  describe 'class methods' do
    xit '::avg_years_exp' do
      expected = Mechanic.avg_years_exp

      expect(expected).to eq(30)
    end
  end


end
