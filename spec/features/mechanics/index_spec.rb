require 'rails_helper'

RSpec.describe 'Mechanics Index Page' do

  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'John Doe', years_experience: 20)
    @mechanic_2 = Mechanic.create!(name: 'Sam', years_experience: 5)
    @mechanic_3 = Mechanic.create!(name: 'Name Example', years_experience: 75)
    visit 'mechanics'
  end

  it 'displays header' do
    expect(page).to have_content('All Mechanics')
  end

  it 'lists all mechanics and their years of experience' do
    expect(page).to have_content('John Doe: 20 years experience')
    expect(page).to have_content('Sam: 5 years experience')
    expect(page).to have_content('Name Example: 75 years experience')
  end

  it 'lists the average years of experience for all mechanics' do
    expect(page).to have_content('Average Years Experience: 33')
  end

end
