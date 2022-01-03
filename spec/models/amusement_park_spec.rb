require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  let!(:wonder_wharf) {AmusementPark.create!(name: "Wonder Wharf", admission_cost: 3)}

  before :each do
    @merry_go_round = wonder_wharf.rides.create!(name: "Happy Whale", thrill_rating: 3, open: true)
    @bumper_cars = wonder_wharf.rides.create!(name: "Bumpy Whale", thrill_rating: 6, open: true)
    @haunted_house = wonder_wharf.rides.create!(name: "Ghost Whale", thrill_rating: 7, open: false)
  end

  describe '#rides_alpha' do
    it 'returns all rides in park in alphabetical order by name' do

      expect(wonder_wharf.rides_alpha).to eq([@bumper_cars, @haunted_house, @merry_go_round])
    end
  end
end
