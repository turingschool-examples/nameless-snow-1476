require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'Instance Methods' do
    it 'sorts rides alphabetically' do
      six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 65)
      ride_1 = six_flags.rides.create!(name: "Roller Coaster", thrill_rating: 8, open: true)
      ride_2 = six_flags.rides.create!(name: "Giant Drop", thrill_rating: 9, open: true)
      ride_3 = six_flags.rides.create!(name: "Scrambler", thrill_rating: 6, open: false)

      expect(six_flags.rides_alphabetically).to eq([ride_2, ride_1, ride_3])
    end

    it 'can average all its rides thrill rating' do
      six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 65)
      ride_1 = six_flags.rides.create!(name: "Roller Coaster", thrill_rating: 8, open: true)
      ride_2 = six_flags.rides.create!(name: "Giant Drop", thrill_rating: 9, open: true)
      ride_3 = six_flags.rides.create!(name: "Scrambler", thrill_rating: 4, open: false)
      
      expect(six_flags.average_thrill_rating).to eq(7)
    end
  end
end
