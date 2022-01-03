require 'rails_helper'
describe 'Mechanics index page' do
  it 'I see a header saying All Mechinics and I see a list of all their names and years of experience' do
    seth = Mechanic.create!(name: 'Seth', years_experience: 1)
    joe = Mechanic.create!(name: 'Joe', years_experience: 2)
    brian = Mechanic.create!(name: 'Brian', years_experience: 3)
    visit '/mechanics'
    expect(page).to have_content("All Mechanics")
    expect(page).to have_content("Name: #{seth.name}")
    expect(page).to have_content("Experience: #{seth.years_experience}")
    expect(page).to have_content("Name: #{joe.name}")
    expect(page).to have_content("Experience: #{joe.years_experience}")
    expect(page).to have_content("Name: #{brian.name}")
    expect(page).to have_content("Experience: #{brian.years_experience}")
  end

  it 'I see the average years of experience of all mechanics' do
    seth = Mechanic.create!(name: 'Seth', years_experience: 1)
    joe = Mechanic.create!(name: 'Joe', years_experience: 2)
    brian = Mechanic.create!(name: 'Brian', years_experience: 3)
    visit '/mechanics'
    expect(page).to have_content("Average Experience: 2")
  end
end
