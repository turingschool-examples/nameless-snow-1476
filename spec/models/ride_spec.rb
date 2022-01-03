require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:ride_mechanics)}
    it { should have_many(:mechanics).through(:ride_mechanics)}
  end

  describe 'class methods' do
    describe 'by_thrill' do
      it 'returns rides in descending order by thrill rating' do
        ride_1 = create(:ride, thrill_rating: 10)
        ride_2 = create(:ride, thrill_rating: 15)
        ride_3 = create(:ride, thrill_rating: 4)

        expect(Ride.by_thrill).to eq([ride_2, ride_1, ride_3])
      end
    end
  end
end
