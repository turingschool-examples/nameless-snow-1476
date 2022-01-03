require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it {should have_many(:ride_mechanics)}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'class methods' do
    let!(:park_1) {AmusementPark.create!(name: '7 Flags', admission_cost: 50)}
    let!(:ride_1) {park_1.rides.create!(name: 'Funny Bugs', thrill_rating: 5, open:true )}
    let!(:ride_1) {park_1.rides.create!(name: 'The Wiggler', thrill_rating: 10, open:true )}
    let!(:ride_1) {park_1.rides.create!(name: 'The Squiggler', thrill_rating: 8, open:false )}
    let!(:mech_1) {Mechanic.create!(name: 'Billy Mechs', years_experience:5)}
    let!(:mech_2) {Mechanic.create!(name: 'Susy Mechs', years_experience:10)}

  it "finds the average of years_experience" do
    expect(Mechanic.average_ages).to eq(7.5)
  end


  end
end
