require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should have_many(:mechanic_rides)}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  it "shows average years exeperience for all mechanics" do
    mechanic1 = Mechanic.create!(name: 'Wade', years_experience: 14)
    mechanic2 = Mechanic.create!(name: 'brett', years_experience: 12)
    mechanic3 = Mechanic.create!(name: 'mack', years_experience: 10)
    expect(Mechanic.average_experience).to eq(12)
  end
end
