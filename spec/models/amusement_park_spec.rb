require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'instance methods' do
    let!(:six_flags){AmusementPark.create!(name: 'Six Flags', admission_cost: 75)}

    let!(:hurler){six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)}
    let!(:scrambler){six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)}
    let!(:ferris){six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)}
    let!(:superman){six_flags.rides.create!(name: 'Superman', thrill_rating: 10, open: true)}

    it '#sorted_rides' do
      expect(six_flags.sorted_rides).to eq [ferris, superman, hurler, scrambler]
    end

    it '#average_thrill' do
      expect(six_flags.average_thrill).to eq 7
    end
  end 
end
