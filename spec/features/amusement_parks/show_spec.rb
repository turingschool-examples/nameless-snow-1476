require 'rails_helper'

RSpec.describe "Amusement Park Show Page" do
  describe "Extension Story" do
  it 'shows the name and price of admissions' do
      six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 65)
      cedar_point = AmusementPark.create!(name: "Cedar Point", admission_cost: 58)

      visit "amusement_parks/#{six_flags.id}"

      expect(page).to have_content(six_flags.name)
      expect(page).to have_content("Admissions: $65.00")
      expect(page).to_not have_content(cedar_point.name)
      expect(page).to_not have_content("Admissions: $58.00")
    end

    it 'has the names of all its rides in alphabetical order' do
      six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 65)
      cedar_point = AmusementPark.create!(name: "Cedar Point", admission_cost: 58)
      ride_1 = six_flags.rides.create!(name: "Roller Coaster", thrill_rating: 8, open: true)
      ride_2 = six_flags.rides.create!(name: "Giant Drop", thrill_rating: 9, open: true)
      ride_3 = six_flags.rides.create!(name: "Scrambler", thrill_rating: 6, open: false)
      ride_4 = cedar_point.rides.create!(name: "Wooden Coaster", thrill_rating: 7, open: false)

      visit "amusement_parks/#{six_flags.id}"

      expect(page).to have_content("Rides:")
      expect(page).to have_content(ride_1.name)
      expect(page).to have_content(ride_2.name)
      expect(page).to have_content(ride_3.name)
      expect(page).to_not have_content(ride_4.name)

      expect(ride_2.name).to appear_before(ride_1.name)
      expect(ride_1.name).to appear_before(ride_3.name)
      expect(ride_3.name).to_not appear_before(ride_2.name)
      expect(ride_3.name).to_not appear_before(ride_1.name)
    end

    it 'has the average thrill rating of its rides' do
      six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 65)
      ride_1 = six_flags.rides.create!(name: "Roller Coaster", thrill_rating: 8, open: true)
      ride_2 = six_flags.rides.create!(name: "Giant Drop", thrill_rating: 9, open: true)
      ride_3 = six_flags.rides.create!(name: "Scrambler", thrill_rating: 4, open: false)

      visit "amusement_parks/#{six_flags.id}"

      expect(page).to have_content("Average Thrill Rating of Rides: 7.0/10")
    end
  end
end
