require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  before(:each) do
    @mech_1 = Mechanic.create!(name: "Joe Shmoe", years_experience: 9)
    @mech_2 = Mechanic.create!(name: "Jon Smith", years_experience: 20)
    @mech_2 = Mechanic.create!(name: "Jane Shmoe", years_experience: 16)

    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @wheel = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 6, open: false)

    @mech_1.rides << @scrambler
    @mech_1.rides << @hurler
    @mech_1.rides << @wheel
  end

  it 'shows the average years of experience of all mechanics' do
    expect(Mechanic.average_years).to eq(15)
  end

  it 'orders the mechanics rides by most thrills to least thrills' do
    expect(@mech_1.most_to_least_thrill).to eq([@hurler, @wheel, @scrambler])
  end
end
