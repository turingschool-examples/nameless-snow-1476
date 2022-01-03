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

  xit "shows average years of experience" do
  end
end
# Story 1 - Mechanic Index Page
#
# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics
