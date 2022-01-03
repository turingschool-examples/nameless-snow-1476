require 'rails_helper'

describe 'AmusementPark Show' do
  before do
    @park = AmusementPark.create(name: 'Hug Land', admission_cost: 1000)
    @ride1 = @park.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @ride2 = @park.rides.create!(name: 'The Curler', thrill_rating: 4, open: true)
    @ride3 = @park.rides.create!(name: 'The Twirler', thrill_rating: 10, open: true)
    visit "/amusement_parks/#{@park.id}"
  end

  describe 'display' do
    it 'name and admission cost' do
      expect(page).to have_content("#{@park.name}")
      expect(page).to have_content("Admission Cost: #{@park.admission_cost}")
    end

    it 'alphabetical list of all rides at park' do
      expect(@ride2.name).to appear_before(@ride1.name)
      expect(@ride1.name).to appear_before(@ride3.name)
    end

    it 'average thrill rating of all park rides' do
      expect(page).to have_content("Park Rides Average Thrill Rating: #{@park.rides.average_thrill}")
    end
  end
end