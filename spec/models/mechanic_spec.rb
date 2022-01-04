require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  it 'finds the average age of all mechanics' do
    mech_1 = Mechanic.create!(name: "Jon", years_experience: 12)
    mech_2 = Mechanic.create!(name: "James", years_experience: 14)
    mech_3 = Mechanic.create!(name: "Sam", years_experience: 9)
    mech_4 = Mechanic.create!(name: "Mike", years_experience: 11)

    expect(Mechanic.avg_age).to eq(11.5)
  end

  it 'finds all rides a mechanic is working on that is open in descending order' do
    amus_1 = AmusementPark.create!(name: "name_1", admission_cost: 75)
    mech_1 = Mechanic.create!(name: "Jon", years_experience: 12)
    mech_2 = Mechanic.create!(name: "James", years_experience: 14)
    mech_3 = Mechanic.create!(name: "Sam", years_experience: 9)
    mech_4 = Mechanic.create!(name: "Mike", years_experience: 11)
    ride_1 = amus_1.rides.create!(name: "ride_1", thrill_rating: 9, open: true)
    ride_2 = amus_1.rides.create!(name: "ride_2", thrill_rating: 1, open: true)
    ride_3 = amus_1.rides.create!(name: "ride_3", thrill_rating: 6, open: false)
    ride_4 = amus_1.rides.create!(name: "ride_4", thrill_rating: 3, open: true)

    mech_1.rides << ride_1
    mech_1.rides << ride_2
    mech_1.rides << ride_3
    mech_1.rides << ride_4

    expect(mech_1.working_on_open_rides).to eq([ride_1, ride_4, ride_2])

  end
end
