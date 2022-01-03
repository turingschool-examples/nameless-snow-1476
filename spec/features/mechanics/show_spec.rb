require 'rails_helper'

RSpec.describe 'mechanic index page' do
  let!(:wonder_wharf) {AmusementPark.create!(name: "Wonder Wharf", admission_cost: 3)}

  let(:merry_go_round) {Ride.create!(name: "Happy Whale", thrill_rating: 3, open: true, amusement_park: wonder_wharf)}
  let(:coaster) {Ride.create!(name: "Whirly Whale", thrill_rating: 8, open: true, amusement_park: wonder_wharf)}
  let(:bumper_cars) {Ride.create!(name: "Bumpy Whale", thrill_rating: 6, open: true, amusement_park: wonder_wharf)}
  let(:haunted_house) {Ride.create!(name: "Ghost Whale", thrill_rating: 7, open: false, amusement_park: wonder_wharf)}
  let(:skating_rink) {Ride.create!(name: "Frozen Whale", thrill_rating: 5, open: false, amusement_park: wonder_wharf)}

  let(:funnel) {Ride.create!(name: "Fried Whale Cakes", thrill_rating: 2, open: true, amusement_park: wonder_wharf)}

  let!(:teddy) {Mechanic.create!(name: "Teddy Handyman", years_of_experience: 23)}
  let!(:bob) {Mechanic.create!(name: "Bob Belcher", years_of_experience: 3)}
  let!(:jim) {Mechanic.create!(name: "Jim Redman", years_of_experience: 35)}

  before :each do
    RideMechanic.create!(ride: merry_go_round, mechanic: teddy)
    RideMechanic.create!(ride: coaster, mechanic: teddy)
    RideMechanic.create!(ride: skating_rink, mechanic: teddy)

    RideMechanic.create!(ride: bumper_cars, mechanic: bob)
    RideMechanic.create!(ride: coaster, mechanic: bob)

    RideMechanic.create!(ride: haunted_house, mechanic: jim)
  end

  it 'displays a mechanics name, exp, and the names of all rides they work on' do
    visit "/mechanics/#{teddy.id}"

    expect(page).to have_content(teddy.name)
    expect(page).to have_content(teddy.years_of_experience)
    expect(page).to have_content(coaster.name)
    expect(page).to have_content(merry_go_round.name)

    visit "/mechanics/#{bob.id}"

    expect(page).to have_content(bob.name)
    expect(page).to have_content(bob.years_of_experience)
    expect(page).to have_content(bumper_cars.name)
    expect(page).to have_content(coaster.name)

    visit "/mechanics/#{jim.id}"

    expect(page).to have_content(jim.name)
    expect(page).to have_content(jim.years_of_experience)
  end

  it 'only displays rides that are open' do
    visit "/mechanics/#{teddy.id}"

    expect(page).to_not have_content(skating_rink.name)

    visit "/mechanics/#{jim.id}"

    expect(page).to_not have_content(haunted_house.name)
  end

  it 'displays rides in descending order of thrill rating' do
    visit "/mechanics/#{teddy.id}"

    expect(coaster.name).to appear_before(merry_go_round.name)

    visit "/mechanics/#{bob.id}"

    expect(coaster.name).to appear_before(bumper_cars.name)
  end

  describe 'adding a ride to a mechanic' do
    it 'displays a form to add a ride to a mechanics workload' do

      visit "/mechanics/#{bob.id}"

      within("#form-add-ride") do
        fill_in :ride_id, with: funnel.id
        click_on "Submit"
      end

      expect(current_path).to eq("/mechanics/#{bob.id}")
      expect(page).to have_content(funnel.name)
      expect(coaster.name).to appear_before(bumper_cars.name)
      expect(bumper_cars.name).to appear_before(funnel.name)
    end
  end
end
