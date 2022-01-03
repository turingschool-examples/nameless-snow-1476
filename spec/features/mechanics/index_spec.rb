require 'rails_helper'

RSpec.describe "Mechanics index page", type: :feature do 

  before(:each) do 
    @mechanic1 = Mechanic.create!(name:"Bob O'Malley", years_experience:15)
    @mechanic2 = Mechanic.create!(name:"Kiersten Singer", years_experience:8)
    @mechanic3 = Mechanic.create!(name:"Sally Smith", years_experience:20)
  end

  it "provides index of all mechanics with names, YOE and average YOE across all mechanics" do

    visit "/mechanics"

    within("#mechanic-section-#{@mechanic1.id}") do 
      expect(page).to have_content("Name: Bob O'Malley")
      expect(page).to have_content("Years of Experience: 15")
    end

    within("#mechanic-section-#{@mechanic2.id}") do 
      expect(page).to have_content("Name: Kiersten Singer")
      expect(page).to have_content("Years of Experience: 8")
    end

    within("#mechanic-section-#{@mechanic3.id}") do 
      expect(page).to have_content("Name: Sally Smith")
      expect(page).to have_content("Years of Experience: 20")
    end

    expect(page).to have_content("Average Years of Experience Across all Mechanics: 14")
  end



end
