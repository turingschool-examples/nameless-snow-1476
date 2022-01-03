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

    it "can list rides the mechanic is working on by thrill" do
      park = AmusementPark.create!(name: "universal", admission_cost: 100)
      ride1 = park.rides.create!(name: "the hulk", thrill_rating: 10, open: false)
      ride2 = park.rides.create!(name: "space mountain", thrill_rating: 3, open: true)
      ride3 = park.rides.create!(name: "E.T.", thrill_rating: 1, open: true)
      mech1 = Mechanic.create(name: "Paul", years_experience: 2)
      ride_mech1 = mech1.ride_mechanics.create!(ride_id: ride1.id)
      ride_mech2 = mech1.ride_mechanics.create!(ride_id: ride2.id)
      ride_mech3 = mech1.ride_mechanics.create!(ride_id: ride3.id)

      expect(mech1.thrill_order).to eq([ride1, ride3, ride2])
    end
  end
end
