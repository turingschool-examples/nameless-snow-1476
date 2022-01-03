require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it {should have_many(:mechanic_rides)}
    it {should have_many(:mechanics).through(:mechanic_rides)}
  end

    it "show open rides ordered by descending thrill rating" do
      amusement_park1 = AmusementPark.create!(name: 'Six Flags', admission_cost: 20)
      amusement_park2 = AmusementPark.create!(name: 'Dutch Wonderland', admission_cost: 30)

      ride1 = amusement_park1.rides.create!(name: 'zipper', thrill_rating: 3, open: true)
      ride2 = amusement_park1.rides.create!(name: 'dipper', thrill_rating: 4, open: true)
      ride3 = amusement_park1.rides.create!(name: 'clipper', thrill_rating: 6, open: false)
      ride4 = amusement_park2.rides.create!(name: 'pipper', thrill_rating: 5, open: true)

      mechanic1 = Mechanic.create!(name: 'Wade', years_experience: 14)
      mechanic2 = Mechanic.create!(name: 'brett', years_experience: 12)
      mechanic3 = Mechanic.create!(name: 'mack', years_experience: 10)

      MechanicRide.create!(mechanic: mechanic1, ride: ride1)
      MechanicRide.create!(mechanic: mechanic1, ride: ride2)
      MechanicRide.create!(mechanic: mechanic1, ride: ride3)
      MechanicRide.create!(mechanic: mechanic1, ride: ride4)

      expect(Ride.ordered_rides).to eq([ride3, ride4, ride2, ride1])
    end
end
