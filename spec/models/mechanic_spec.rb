require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe "methods" do
    it "can return the average years experience for all mechanics" do
      mech1 = Mechanic.create(name: "Paul", years_experience: 2)
      mech2 = Mechanic.create(name: "paulie", years_experience: 4)

      expect(Mechanic.avg_years_exp).to eq 3
    end
  end
end
