require 'rails_helper'

RSpec.describe 'amusement_park show page' do
  let!(:wonder_wharf) {AmusementPark.create!(name: "Wonder Wharf", admission_cost: 3)}

  let(:merry_go_round) {Ride.create!(name: "Happy Whale", thrill_rating: 3, open: true, amusement_park: wonder_wharf)}
  let(:coaster) {Ride.create!(name: "Whirly Whale", thrill_rating: 8, open: true, amusement_park: wonder_wharf)}
  let(:bumper_cars) {Ride.create!(name: "Bumpy Whale", thrill_rating: 6, open: true, amusement_park: wonder_wharf)}
  let(:haunted_house) {Ride.create!(name: "Ghost Whale", thrill_rating: 7, open: false, amusement_park: wonder_wharf)}
  let(:skating_rink) {Ride.create!(name: "Frozen Whale", thrill_rating: 5, open: false, amusement_park: wonder_wharf)}

  before :each do
    visit "/amusement_park/#{wonder_wharf.id}"
  end

  it 'displays the name and price of admission' do

    expect(page).to have_content(wonder_wharf.name)
    expect(page).to have_content(wonder_wharf.admission_cost)
  end

  it 'displays the names of all rides in alphabetical order' do

    expect(bumper_cars.name).to appear_before(skating_rink.name)
    expect(skating_rink.name).to appear_before(haunted_house.name)
    expect(haunted_house.name).to appear_before(merry_go_round.name)
    expect(merry_go_round.name).to appear_before(coaster.name)
  end

  xit 'displays an average thrill rating for all rides' do

    expect(page).to have_content("Average Thrill Rating: #{wonder_wharf.average_thrill}")
  end
end
