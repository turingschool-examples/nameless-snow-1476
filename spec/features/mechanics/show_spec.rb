require 'rails_helper'

RSpec.describe "Mechanic show page", type: :feature do 

  before(:each) do 
    @park1 = AmusementPark.create!(name:"Kennywood", admission_cost:25)

    @mechanic1 = Mechanic.create!(name:"Bob O'Malley", years_experience:15)
    @mechanic2 = Mechanic.create!(name:"Kiersten Singer", years_experience:8)
    @mechanic3 = Mechanic.create!(name:"Sally Smith", years_experience:20)

    @ride1 = @park1.rides.create!(name:"Steel Phantom", thrill_rating:8, open: true)
    @ride2 = @park1.rides.create!(name:"Jack Rabbit", thrill_rating:5, open: false)
    @ride3 = @park1.rides.create!(name:"Thunderbolt", thrill_rating:6, open: true)
    @ride4 = @park1.rides.create!(name:"Racer", thrill_rating:6, open: true)
    @ride5 = @park1.rides.create!(name:"Phantom's Revenge", thrill_rating:9, open: true)
    @ride6 = @park1.rides.create!(name:"Steel Curtain", thrill_rating:9, open: true)

    @mechanic3.rides << @ride1 
    @mechanic3.rides << @ride2 
    @mechanic3.rides << @ride3
    @mechanic3.rides << @ride5

    @mechanic2.rides << @ride4
  end

  it "show page provides specified mechanic's details" do 
    visit "/mechanics/#{@mechanic3.id}"

    expect(page).to have_content("Mechanic Detail Page: Sally Smith")
    expect(page).to have_content("Years of Experience: 20")

    expect(page).to_not have_content("Name: Bob O'Malley")
    expect(page).to_not have_content("Years of Experience: 15")
  end

  it "show page provides only OPEN rides this mechanic is working on" do 
    visit "/mechanics/#{@mechanic3.id}"

    expect(page).to have_content("Steel Phantom")
    expect(page).to have_content("Thunderbolt")

    expect(page).to_not have_content("Jack Rabbit")
    expect(page).to_not have_content("Racer")
  end

  it "show page lists rides this mechanic is working on by thrill rating in descending order with most thrills first" do 
    visit "/mechanics/#{@mechanic3.id}"

    expect("Phantom's Revenge").to appear_before("Steel Phantom")
    expect("Steel Phantom").to appear_before("Thunderbolt")
    expect("Phantom's Revenge").to appear_before("Thunderbolt")
  end


  describe "has a form to add a ride to a mechanic's workload" do 

    it "renders the add form" do
      visit "/mechanics/#{@mechanic2.id}"

      expect(page).to have_content("Add a ride to #{@mechanic2.name}'s workload:")

      expect(find('form')).to have_content("Ride ID")
    end  
  
    it "form adds a ride to a mechanic's workload" do 
      visit "/mechanics/#{@mechanic2.id}"
      
      fill_in "Ride ID", with: "#{@ride6.id}"
      click_button "Submit"

      expect(page).to have_current_path("/mechanics/#{@mechanic2.id}")
      expect(page).to have_content("Steel Curtain")
    end
  end
end
