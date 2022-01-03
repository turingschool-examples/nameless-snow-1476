require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 5, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 7, open: true)
    @wheel = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 3, open: false)
    @mind = @six_flags.rides.create!(name: 'Mind Eraser', thrill_rating: 9, open: true)
  end

  it 'can sort rides alphabetically' do
    expect(@six_flags.rides_alpha).to eq([@wheel, @mind, @hurler, @scrambler])
  end

  it 'can calculate the rides average thrill rating' do
    expect(@six_flags.average_thrill).to eq(6)
  end
end
