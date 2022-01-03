require 'rails_helper'

RSpec.describe "Amusement Park Show page", type: :feature do 

  before(:each) do 
    @park1 = AmusementPark.create!(name:"Kennywood", admission_cost:25)

    @ride1 = @park1.rides.create!(name:"Steel Phantom", thrill_rating:8, open: true)
    @ride2 = @park1.rides.create!(name:"Jack Rabbit", thrill_rating:5, open: false)
    @ride3 = @park1.rides.create!(name:"Thunderbolt", thrill_rating:6, open: true)
    @ride4 = @park1.rides.create!(name:"Racer", thrill_rating:6, open: true)
    
    @park2 = AmusementPark.create!(name:"Hershey Park", admission_cost:50)

    @ride5 = @park2.rides.create!(name:"Storm Runner", thrill_rating:6)
    @ride6 = @park2.rides.create!(name:"Lightning Racer", thrill_rating:4)
    @ride7 = @park2.rides.create!(name:"The Great Bear", thrill_rating:8)    
  end

  it "shows amusement park name and price of admission" do 
    visit "/amusement_parks/#{@park2.id}"

    expect(page).to have_content(@park2.name)
    expect(page).to have_content("Admission: $50.00")

    expect(page).to_not have_content(@park1.name)
    expect(page).to_not have_content("Admission: $25.00")
  end

  it "shows names of all rides at the park in alphabetical order" do
    visit "/amusement_parks/#{@park2.id}"
   
    expect(page).to have_content("Lightning Racer")
    expect(page).to have_content("Storm Runner")
    expect(page).to have_content("The Great Bear")

    expect("Lightning Racer").to appear_before("Storm Runner")
    expect("Storm Runner").to appear_before("The Great Bear")
    expect("Lightning Racer").to appear_before("The Great Bear")

    expect(page).to_not have_content("Thunderbolt")
    expect(page).to_not have_content("Jack Rabbit")
    expect(page).to_not have_content("Steel Phantom")
  end

  it "shows average thrill rating of all the rides at the amusement park" do
    visit "/amusement_parks/#{@park2.id}"

    expect(page).to have_content("Average Ride Thrill Rating: 6.0/10")
  end

end
