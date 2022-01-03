require 'rails_helper'

RSpec.describe 'mechanics' do
  let!(:carol){Mechanic.create!(name: "Carol Cosgrove", years_experience: 12)}
  let!(:six_flags){AmusementPark.create!(name: 'Six Flags', admission_cost: 75)}

  let!(:hurler){six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)}
  let!(:scrambler){six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)}
  let!(:ferris){six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)}

  let!(:mech_ride_1){MechanicsRide.create!(mechanic_id: carol.id, ride_id: hurler.id)}
  let!(:mech_ride_2){MechanicsRide.create!(mechanic_id: carol.id, ride_id: ferris.id)}
  let!(:mech_ride_3){MechanicsRide.create!(mechanic_id: carol.id, ride_id: scrambler.id)}

  describe 'when a user visits the show page' do
    it "shows the mechanic's name, years of experience, and rides currently working on" do
      visit "/mechanics/#{carol.id}"

      expect(page).to have_content(carol.name)
      expect(page).to have_content(carol.years_experience)
      # save_and_open_page
      expect(page).to have_content(hurler.name)
      expect(page).to have_content(scrambler.name)
      expect(page).to_not have_content(ferris.name)

      expect(hurler.name).to appear_before(scrambler.name)
    end
  end
end
