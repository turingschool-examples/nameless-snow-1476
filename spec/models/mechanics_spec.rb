require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:mechanic_rides)}
    it { should have_many(:rides).through(:mechanic_rides)}
  end

  it "returns the average years of experience of all mechanics " do
    @mechanic_1 = Mechanic.create(name: "Mech 1", years_experience: 5)
    @mechanic_2 = Mechanic.create(name: "Mech 2", years_experience: 10)
    expect(Mechanic.average_year).to eq(7.5)
  end
end
