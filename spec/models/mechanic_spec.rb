require 'rails_helper'

RSpec.describe Mechanic do
  let!(:larry){Mechanic.create!(name: "Larry", years_experience: 9)}
  let!(:george){Mechanic.create!(name: "George", years_experience: 3)}
  let!(:carol){Mechanic.create!(name: "Carol", years_experience: 12)}

  let!(:six_flags){AmusementPark.create!(name: 'Six Flags', admission_cost: 75)}

  let!(:hurler){six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)}
  let!(:scrambler){six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)}
  let!(:ferris){six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)}

  let!(:mech_ride_1){MechanicsRide.create!(mechanic_id: carol.id, ride_id: hurler.id)}
  let!(:mech_ride_2){MechanicsRide.create!(mechanic_id: carol.id, ride_id: ferris.id)}
  let!(:mech_ride_3){MechanicsRide.create!(mechanic_id: carol.id, ride_id: scrambler.id)}

  describe 'relationships' do
    it { should have_many(:rides) }
    it { should have_many(:mechanics_rides)}
    it { should have_many(:rides)}
  end

  describe 'class methods' do

    it '#average_years' do
      mechs = Mechanic.all
      expect(mechs.average_years).to eq 8
    end
  end
  describe 'instance methods' do
    it '#current_rides' do
      expect(carol.current_rides).to eq [hurler, scrambler]
    end
  end 
end
