require 'rails_helper'

RSpec.describe 'Mechanic Show Page' do
  it 'show mechanic info and rides they are working on' do
    park = AmusementPark.create!(name: "Funland", admission_cost: 5)
    terror = park.rides.create!(name: "Tower of Terror", thrill_rating: 9, open: true )
    fahrenheit = park.rides.create!(name: "Fahrenheit", thrill_rating: 8, open: false )
    kiss = park.rides.create!(name: "Kiss Raise", thrill_rating: 2, open: true )
    frog = park.rides.create!(name: "Frog Hopper", thrill_rating: 5, open: true )
    karen = Mechanic.create!(names: "Karen Smith", years: 11)
    bob = Mechanic.create!(names: "Bob Smith", years: 10)
    max = Mechanic.create!(names: "Max Smith", years: 9)

    karen.rides << terror
    karen.rides << kiss
    bob.rides << kiss
    max.rides << frog

    visit "/mechanics/#{karen.id}"

    expect(page).to have_content(karen.names)
    expect(page).to have_content(karen.years)
    expect(page).to have_content(terror.name)
    expect(page).to have_content(kiss.name)
    expect(page).to_not have_content(frog.name)
  end

  it 'shows only rides that are open' do
    park = AmusementPark.create!(name: "Funland", admission_cost: 5)
    terror = park.rides.create!(name: "Tower of Terror", thrill_rating: 9, open: true )
    fahrenheit = park.rides.create!(name: "Fahrenheit", thrill_rating: 8, open: false )
    kiss = park.rides.create!(name: "Kiss Raise", thrill_rating: 2, open: true )
    frog = park.rides.create!(name: "Frog Hopper", thrill_rating: 5, open: true )
    karen = Mechanic.create!(names: "Karen Smith", years: 11)
    bob = Mechanic.create!(names: "Bob Smith", years: 10)
    max = Mechanic.create!(names: "Max Smith", years: 9)

    karen.rides << terror
    karen.rides << kiss
    karen.rides << fahrenheit
    bob.rides << kiss
    max.rides << frog

    visit "/mechanics/#{karen.id}"
    expect(page).to have_content(terror.name)
    expect(page).to have_content(kiss.name)
    expect(page).to_not have_content(fahrenheit.name)
  end

  it 'shows rides by thrill rating in descending order' do
    park = AmusementPark.create!(name: "Funland", admission_cost: 5)
    kiss = park.rides.create!(name: "Kiss Raise", thrill_rating: 2, open: true )
    terror = park.rides.create!(name: "Tower of Terror", thrill_rating: 9, open: true )
    fahrenheit = park.rides.create!(name: "Fahrenheit", thrill_rating: 8, open: false )
    frog = park.rides.create!(name: "Frog Hopper", thrill_rating: 5, open: true )
    karen = Mechanic.create!(names: "Karen Smith", years: 11)
    bob = Mechanic.create!(names: "Bob Smith", years: 10)
    max = Mechanic.create!(names: "Max Smith", years: 9)

    karen.rides << kiss
    karen.rides << terror
    karen.rides << fahrenheit
    bob.rides << kiss
    max.rides << frog

    visit "/mechanics/#{karen.id}"
    expect(terror.name).to appear_before(kiss.name)
  end
end


# Story 3 - Add a Ride to a Mechanic
#
# As a user,
# When I go to a mechanics show page
# I see a form to add a ride to their workload
# When I fill in that field with an id of an existing ride and hit submit
# I’m taken back to that mechanic's show page
# And I see the name of that newly added ride on this mechanics show page
#
# Ex:
# Mechanic: Kara Smith
# Years of Experience: 11
#
# Current rides they’re working on:
# The Frog Hopper
# Fahrenheit
# The Kiss Raise
#
# Add a ride to workload:
# Ride Id: _pretend_this_is_a_textfield_
# Submit
