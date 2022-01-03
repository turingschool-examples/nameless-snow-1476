require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  let!(:wonder_wharf) {AmusementPark.create!(name: "Wonder Wharf", admission_cost: 3)}

  describe '#rides_alpha' do
    it 'returns all rides in park in alphabetical order by name' do
      wonder_wharf.rides.create!(name: "Happy Whale", thrill_rating: 3, open: true)
      wonder_wharf.rides.create!(name: "Bumpy Whale", thrill_rating: 6, open: true)
      wonder_wharf.rides.create!(name: "Ghost Whale", thrill_rating: 7, open: false)

      expect(wonder_wharf.rides_alpha).to eq(["Bumpy Whale", "Ghost Whale", "Happy Whale"])
    end
  end
end
