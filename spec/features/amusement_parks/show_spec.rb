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

    xit 'has the names of all its rides in alphabetical order' do
        visit "amusement_parks/#{six_flags.id}"
    end
    xit 'has the average thrill rating of its rides' do
        visit "amusement_parks/#{six_flags.id}"
    end
  end
end
