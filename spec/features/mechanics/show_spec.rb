require 'rails_helper'

RSpec.describe 'mechanic show page' do

  it "shows their name" do
    mech = create(:mechanic, name: 'Bob')

    visit "/mechanics/#{@mech.id}"

    expect(page).to have_content('Bob')
  end

  it "shows their years_experience" do
    mech = create(:mechanic, years_experience: 5)

    visit "/mechanics/#{@mech.id}"

    expect(page).to have_content(5)
  end

  it "shows all open rides they are working" do
    mech = create(:mechanic)
    ride_1 = create(:ride)
    ride_2 = create(:ride)
    ride_3 = create(:ride, open: false)
    ride_mechanic = create(ride: ride_1, mechanic: mech)
    ride_mechanic = create(ride: ride_2, mechanic: mech)
    ride_mechanic = create(ride: ride_3, mechanic: mech)

    visit "/mechanics/#{@mech.id}"

    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to_not have_content(ride_3.name)
  end
end
