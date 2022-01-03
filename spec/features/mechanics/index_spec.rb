require 'rails_helper'

RSpec.describe 'Mechanics Index' do
  it "has a header" do
    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
  end

  it "lists all mechanics by name and has their years of experience" do
    mech1 = Mechanic.create(name: "Paul", years_experience: 2)
    mech2 = Mechanic.create(name: "paulie", years_experience: 4)

    visit '/mechanics'

    expect(page).to have_content("Paul")
    expect(page).to have_content(2)
    expect(page).to have_content("paulie")
    expect(page).to have_content(4)
    expect(page).to_not have_content("Stacy")
    expect(page).to_not have_content(70)
  end

  it "shows the average years of experience across all mechanics" do
    mech1 = Mechanic.create(name: "Paul", years_experience: 2)
    mech2 = Mechanic.create(name: "paulie", years_experience: 4)

    visit '/mechanics'

    expect(page).to have_content("Average years of experience: 3")
  end

end
