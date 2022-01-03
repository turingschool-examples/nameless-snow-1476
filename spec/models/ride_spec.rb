require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  describe 'model methods' do
    it "can list only rides that are open" do
      park = AmusementPark.create!(name: "universal", admission_cost: 100)
      ride1 = park.rides.create!(name: "the hulk", thrill_rating: 10, open: false)
      ride2 = park.rides.create!(name: "space mountain", thrill_rating: 3, open: true)
      ride3 = park.rides.create!(name: "E.T.", thrill_rating: 1, open: true)

      expect(Ride.open_rides).to eq([ride2, ride3])
    end

    # it "can order by thrill" do
    #   park = AmusementPark.create!(name: "universal", admission_cost: 100)
    #   ride1 = park.rides.create!(name: "the hulk", thrill_rating: 10, open: false)
    #   ride2 = park.rides.create!(name: "space mountain", thrill_rating: 1, open: true)
    #   ride3 = park.rides.create!(name: "E.T.", thrill_rating: 3, open: true)
    # 
    #   expect(Ride.thrill_order).to eq([ride1, ride3, ride2])
    # end
  end
end
