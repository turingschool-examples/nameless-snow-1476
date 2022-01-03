require 'rails_helper'

RSpec.describe Mechanic do
  describe 'Relationships' do
    it { should have_many :ride_mechanics}
    it { should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'Class Methods' do
    it 'calculate average years experience of all mechanics' do

      mechanic_1 = Mechanic.create!(name: "Rob", years_experience: 7)
      mechanic_2 = Mechanic.create!(name: "Dana", years_experience: 15)
      mechanic_3 = Mechanic.create!(name: "Burt", years_experience: 20)

      expect(Mechanic.average_years_experience).to eq(14)
    end
  end

  describe 'Instance Methods' do
    it 'orders a mechanics rides by thrill rating descending and only selects open rides' do
      mechanic_1 = Mechanic.create!(name: "Rob", years_experience: 7)
      mechanic_2 = Mechanic.create!(name: "Dana", years_experience: 15)
      six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 65)
      ride_1 = six_flags.rides.create!(name: "Ride 1 Name", thrill_rating: 7, open: true)
      ride_2 = six_flags.rides.create!(name: "Ride 2 Name", thrill_rating: 9, open: true)
      ride_3 = six_flags.rides.create!(name: "Ride 3 Name", thrill_rating: 3, open: false)
      ride_4 = six_flags.rides.create!(name: "Ride 4 Name", thrill_rating: 10, open: true)
      ride_5 = six_flags.rides.create!(name: "Ride 5 Name", thrill_rating: 2, open: true)

      RideMechanic.create!(ride_id: ride_1.id, mechanic_id: mechanic_1.id)
      RideMechanic.create!(ride_id: ride_2.id, mechanic_id: mechanic_1.id)
      RideMechanic.create!(ride_id: ride_3.id, mechanic_id: mechanic_1.id)
      RideMechanic.create!(ride_id: ride_4.id, mechanic_id: mechanic_1.id)
      RideMechanic.create!(ride_id: ride_5.id, mechanic_id: mechanic_2.id)

      expect(mechanic_1.open_rides_ordered).to eq([ride_4, ride_2, ride_1])
    end
  end
end
