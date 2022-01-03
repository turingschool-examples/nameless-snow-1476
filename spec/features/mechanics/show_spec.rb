require 'rails_helper'

RSpec.describe 'mechanic show page' do

  it "shows their name" do
    mech = create(:mechanic, name: 'Bob')

    visit "/mechanics/#{mech.id}"

    expect(page).to have_content('Bob')
  end

  it "shows their years_experience" do
    mech = create(:mechanic, years_experience: 5)

    visit "/mechanics/#{mech.id}"

    expect(page).to have_content(5)
  end

  it "shows all open rides they are working" do
    mech = create(:mechanic)
    ride_1 = create(:ride)
    ride_2 = create(:ride)
    ride_3 = create(:ride, open: false)
    ride_mechanic_1 = create(:ride_mechanic, ride: ride_1, mechanic: mech)
    ride_mechanic_2 = create(:ride_mechanic, ride: ride_2, mechanic: mech)
    ride_mechanic_3 = create(:ride_mechanic, ride: ride_3, mechanic: mech)

    visit "/mechanics/#{mech.id}"

    within 'div.rides' do
      expect(page).to have_content(ride_1.name)
      expect(page).to have_content(ride_2.name)
      expect(page).to_not have_content(ride_3.name)
    end
  end

  it 'shows all rides in descending order' do
    mech = create(:mechanic)
    ride_1 = create(:ride, thrill_rating: 10)
    ride_2 = create(:ride, thrill_rating: 15)
    ride_3 = create(:ride, thrill_rating: 4)
    ride_mechanic_1 = create(:ride_mechanic, ride: ride_1, mechanic: mech)
    ride_mechanic_2 = create(:ride_mechanic, ride: ride_2, mechanic: mech)
    ride_mechanic_3 = create(:ride_mechanic, ride: ride_3, mechanic: mech)

    visit "/mechanics/#{mech.id}"

    within 'div.rides' do
      expect(ride_2.name).to appear_before(ride_1.name)
      expect(ride_1.name).to appear_before(ride_3.name)
    end
  end

  it "has a form to add an existing ride to their workload" do
    mech = create(:mechanic)
    ride_1 = create(:ride, thrill_rating: 10)
    ride_2 = create(:ride, thrill_rating: 15)
    ride_3 = create(:ride, thrill_rating: 4)
    ride_4 = create(:ride, thrill_rating: 100)
    ride_mechanic_1 = create(:ride_mechanic, ride: ride_1, mechanic: mech)
    ride_mechanic_2 = create(:ride_mechanic, ride: ride_2, mechanic: mech)
    ride_mechanic_3 = create(:ride_mechanic, ride: ride_3, mechanic: mech)

    visit "/mechanics/#{mech.id}"
    expect(page).to_not have_content(ride_4.name)

    within 'div.new_ride' do
      fill_in 'ride_id', with: ride_4.id
      click_button "Submit"
    end

    expect(current_path).to eq("/mechanics/#{mech.id}")
    expect(page).to have_content(ride_4.name)
  end
end
