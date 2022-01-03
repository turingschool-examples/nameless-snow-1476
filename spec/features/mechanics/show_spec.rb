require 'rails_helper'

RSpec.describe "Mechanic Show Page" do
  describe 'User Story 2' do
    it 'has the mechanic name and years experience' do
      mechanic_1 = Mechanic.create!(name: "Rob", years_experience: 7)
      mechanic_2 = Mechanic.create!(name: "Dana", years_experience: 15)
      mechanic_3 = Mechanic.create!(name: "Burt", years_experience: 20)

      visit "/mechanics/#{mechanic_1.id}"

      expect(page).to have_content("Mechanic: #{mechanic_1.name}")
      expect(page).to have_content("Years Experience: #{mechanic_1.years_experience}")
      expect(page).to_not have_content("Mechanic: #{mechanic_2.name}")
      expect(page).to_not have_content("Years Experience: #{mechanic_2.years_experience}")
      expect(page).to_not have_content("Mechanic: #{mechanic_3.name}")
      expect(page).to_not have_content("Years Experience: #{mechanic_3.years_experience}")
    end

    it 'has the names of the rides they are working on, only if they are open; rides are listed by thrill rating in desc order' do
      mechanic_1 = Mechanic.create!(name: "Rob", years_experience: 7)
      mechanic_2 = Mechanic.create!(name: "Dana", years_experience: 15)
      six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 65)
      ride_1 = six_flags.rides.create!(name: "Ride 1 Name", thrill_rating: 7, open: true)
      ride_2 = six_flags.rides.create!(name: "Ride 2 Name", thrill_rating: 9, open: true)
      ride_3 = six_flags.rides.create!(name: "Ride 3 Name", thrill_rating: 3, open: false)
      ride_4 = six_flags.rides.create!(name: "Ride 4 Name", thrill_rating: 10, open: true)
      ride_5 = six_flags.rides.create!(name: "Ride 5 Name", thrill_rating: 2, open: true)

      RideMechanic.create!(ride_id: ride_1.id, mechanic_id: mechanic_1.id)
      RideMechanic.create!(ride_id: ride_2.id, mechanic_id: mechanic_1.id)
      RideMechanic.create!(ride_id: ride_3.id, mechanic_id: mechanic_1.id)
      RideMechanic.create!(ride_id: ride_4.id, mechanic_id: mechanic_1.id)
      RideMechanic.create!(ride_id: ride_5.id, mechanic_id: mechanic_2.id)

      visit "/mechanics/#{mechanic_1.id}"

      expect(page).to have_content("Current rides they're working on:")
      expect(page).to have_content("Ride Name: #{ride_1.name}")
      expect(page).to have_content("Thrill Rating: #{ride_1.thrill_rating}")
      expect(page).to have_content("Ride Name: #{ride_2.name}")
      expect(page).to have_content("Thrill Rating: #{ride_2.thrill_rating}")
      expect(page).to have_content("Ride Name: #{ride_4.name}")
      expect(page).to have_content("Thrill Rating: #{ride_4.thrill_rating}")
      expect(page).to_not have_content("Ride Name: #{ride_3.name}")
      expect(page).to_not have_content("Thrill Rating: #{ride_3.thrill_rating}")
      expect(page).to_not have_content("Ride Name: #{ride_5.name}")
      expect(page).to_not have_content("Thrill Rating: #{ride_5.thrill_rating}")

      expect(ride_4.name).to appear_before(ride_2.name)
      expect(ride_2.name).to appear_before(ride_1.name)
      expect(ride_1.name).to_not appear_before(ride_2.name)
      expect(ride_1.name).to_not appear_before(ride_4.name)
    end
  end

  describe 'User Story 3' do
    it 'can add an existing ride to a mechanics workload by ride id' do
      mechanic_1 = Mechanic.create!(name: "Rob", years_experience: 7)
      six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 65)
      ride_1 = six_flags.rides.create!(name: "Ride 1 Name", thrill_rating: 7, open: true)
      ride_2 = six_flags.rides.create!(name: "Ride 2 Name", thrill_rating: 9, open: true)
      ride_3 = six_flags.rides.create!(name: "Ride 3 Name", thrill_rating: 3, open: false)
      ride_4 = six_flags.rides.create!(name: "Ride 4 Name", thrill_rating: 10, open: true)
      ride_6 = six_flags.rides.create!(name: "Ride 6 Name", thrill_rating: 6, open: true)

      RideMechanic.create!(ride_id: ride_1.id, mechanic_id: mechanic_1.id)
      RideMechanic.create!(ride_id: ride_2.id, mechanic_id: mechanic_1.id)
      RideMechanic.create!(ride_id: ride_3.id, mechanic_id: mechanic_1.id)
      RideMechanic.create!(ride_id: ride_4.id, mechanic_id: mechanic_1.id)

      visit "/mechanics/#{mechanic_1.id}"

      expect(page).to have_content("Add a ride to workload")
      expect(page).to_not have_content(ride_6.name)
      expect(page).to_not have_content(ride_6.thrill_rating)

      fill_in "Ride Id", with: ride_6.id
      click_on "Submit"

      expect(current_path).to eq("/mechanics/#{mechanic_1.id}")
      expect(page).to have_content(ride_6.name)
      expect(page).to have_content(ride_6.thrill_rating)
    end
  end
end
