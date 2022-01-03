require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'associations' do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'class methods' do
    describe 'avg_years_experience' do
      it 'returns the avg_years_experience of all mechanics if mechanics exist' do
        mech_1 = create(:mechanic, years_experience: 10)
        mech_1 = create(:mechanic, years_experience: 15)
        mech_1 = create(:mechanic, years_experience: 13)

        expect(Mechanic.avg_years_experience.round(2)).to eq(12.67)
      end

      it 'returns nil if no mechanics exist' do
        expect(Mechanic.avg_years_experience).to eq(nil)
      end

    end
  end

  describe 'instance methods' do
    describe 'open_rides' do
      it "returns open rides that the mechanic is working on" do
        mech = create(:mechanic)
        ride_1 = create(:ride)
        ride_2 = create(:ride)
        ride_3 = create(:ride, open: false)
        ride_mechanic_1 = create(:ride_mechanic, ride: ride_1, mechanic: mech)
        ride_mechanic_2 = create(:ride_mechanic, ride: ride_2, mechanic: mech)
        ride_mechanic_3 = create(:ride_mechanic, ride: ride_3, mechanic: mech)

        expect(mech.open_rides).to eq([ride_1, ride_2])
      end
    end
  end

  describe 'open_rides_by_thrill' do
    it "returns open rides by thrill reating in desending order" do
      mech = create(:mechanic)
      ride_1 = create(:ride, thrill_rating: 10)
      ride_2 = create(:ride, thrill_rating: 15)
      ride_3 = create(:ride, open: false)
      ride_4 = create(:ride, thrill_rating: 5)
      ride_mechanic_1 = create(:ride_mechanic, ride: ride_1, mechanic: mech)
      ride_mechanic_2 = create(:ride_mechanic, ride: ride_2, mechanic: mech)
      ride_mechanic_3 = create(:ride_mechanic, ride: ride_3, mechanic: mech)
      ride_mechanic_4 = create(:ride_mechanic, ride: ride_4, mechanic: mech)

      expect(Mechanic.open_rides_by_thrill).to eq([ride_2, ride_1, ride_4])
    end
  end
end
