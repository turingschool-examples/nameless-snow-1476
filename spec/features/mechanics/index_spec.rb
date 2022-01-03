require 'rails_helper'

RSpec.describe 'mechanic index page' do

  let!(:teddy) {Mechanic.create!(name: "Teddy Handyman", years_of_experience: 23)}
  let!(:bob) {Mechanic.create!(name: "Bob Belcher", years_of_experience: 3)}
  let!(:jim) {Mechanic.create!(name: "Jim Redman", years_of_experience: 35)}

  it "has a header that says 'All Mechanics' " do

    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
  end

  it 'lists all mechanics names and years of experience' do

    visit '/mechanics'

    expect(page).to have_content(teddy.name)
    expect(page).to have_content(teddy.years_of_experience)
    expect(page).to have_content(bob.name)
    expect(page).to have_content(bob.years_of_experience)
    expect(page).to have_content(jim.name)
    expect(page).to have_content(jim.years_of_experience)
  end

  it 'displays the average years of experience for all mechanics' do

    visit '/mechanics'

    expect(page).to have_content("Average Years of Experience: #{Mechanic.average_exp}")
  end
end
