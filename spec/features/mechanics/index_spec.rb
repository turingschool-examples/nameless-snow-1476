require 'rails_helper'

RSpec.describe 'Mechanics Index' do
  xit "has a header" do
    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
  end

  xit "lists all mechanics by name and has their years of experience" do
    mech1 = Mechanic.create(name: "Paul", years_experience: 2)
    mech2 = Mechanic.create(name: "paulie", years_experience: 4)

    visit '/mechanics'


  end

end
