require "rails_helper"

RSpec.describe "Mechanics Index page" do
  it "shows all mechanics and their attributes" do
    karen = Mechanic.create!(names: "Karen Smith", years: 11)
    bob = Mechanic.create!(names: "Bob Smith", years: 10)
    max = Mechanic.create!(names: "Max Smith", years: 9)

    visit "/mechanics/"

    expect(page).to have_content(karen.names)
    expect(page).to have_content(karen.years)
    expect(page).to have_content(bob.names)
    expect(page).to have_content(bob.years)
    expect(page).to have_content(max.names)
    expect(page).to have_content(max.years)
  end

  it "shows average years of experience" do
    karen = Mechanic.create!(names: "Karen Smith", years: 11)
    bob = Mechanic.create!(names: "Bob Smith", years: 10)
    max = Mechanic.create!(names: "Max Smith", years: 9)

    visit "/mechanics/"

    expect(page).to have_content("Average Experience: 10.0 years")
  end
end
