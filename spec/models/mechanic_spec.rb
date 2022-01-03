require 'rails_helper'

RSpec.describe Mechanic do
  before(:each) do
    @mechanic_1 = Mechanic.create(name: "Bob", years_experience: 10)
    @mechanic_2 = Mechanic.create(name: "Pam", years_experience: 14)
    @mechanic_3 = Mechanic.create(name: "Michael", years_experience: 3)
  end
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics)}
  end

  describe '::experience' do
    it 'returns the average years of experience of all mechanics' do
      expect(Mechanic.experience).to eq(9)
    end
  end
end
