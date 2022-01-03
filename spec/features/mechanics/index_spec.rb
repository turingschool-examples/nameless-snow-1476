require 'rails_helper'

# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics

RSpec.describe "the Mechanics index page" do
  before(:each) do
    @mech_1 = Mechanic.create!(name: "Joe Shmoe", years_experience: 9)
    @mech_2 = Mechanic.create!(name: "Jon Smith", years_experience: 20)
    @mech_2 = Mechanic.create!(name: "Jane Shmoe", years_experience: 16)
    visit "/mechanics"
  end

  it "lists all mechanics ages and year of experience" do
    expect(page).to have_content(@mech_1.name)
    expect(page).to have_content(@mech_1.years_experience)
  end

  it 'lists the average years of experience of all mechanics' do
    expect(page).to have_content("Average years of experience of all mechanics: 15")
  end
end
