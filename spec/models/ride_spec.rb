require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanic_rides) }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 5, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 7, open: true)
    @wheel = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 6, open: false)
  end

  it 'sorts to only open rides' do
    expect(Ride.open?).to eq([@hurler, @scrambler])
  end

  it 'sorts the rides by desc thrill rating' do
    expect(Ride.desc_thrill).to eq([@scrambler, @wheel, @hurler])
  end
end
