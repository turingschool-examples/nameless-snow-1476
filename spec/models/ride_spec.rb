require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }

    it { should have_many :mechanic_rides}
    # it { should have_many(:mechanics).through(:mechanic_rides)}
  end

  describe 'methods' do
    it 'only displays open rides' do
      park = AmusementPark.create!(name: "Funland", admission_cost: 5)
      terror = park.rides.create!(name: "Tower of Terror", thrill_rating: 9, open: true )
      fahrenheit = park.rides.create!(name: "Fahrenheit", thrill_rating: 8, open: false )
      kiss = park.rides.create!(name: "Kiss Raise", thrill_rating: 2, open: true )
      frog = park.rides.create!(name: "Frog Hopper", thrill_rating: 5, open: true )

      expect(Ride.opened).to eq([terror, kiss, frog])
      expect(Ride.opened).to_not eq(fahrenheit)
    end

    it 'displays rides in thrill order' do
      park = AmusementPark.create!(name: "Funland", admission_cost: 5)
      terror = park.rides.create!(name: "Tower of Terror", thrill_rating: 9, open: true )
      fahrenheit = park.rides.create!(name: "Fahrenheit", thrill_rating: 8, open: false )
      kiss = park.rides.create!(name: "Kiss Raise", thrill_rating: 2, open: true )
      frog = park.rides.create!(name: "Frog Hopper", thrill_rating: 5, open: true )

      expect(Ride.thrill_order).to eq([terror, fahrenheit, frog, kiss])
    end
  end
end
