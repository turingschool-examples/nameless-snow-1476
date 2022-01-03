require 'rails_helper'

RSpec.describe 'the mechanics index page' do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'mechanic_1', years_experience: 1)
    @mechanic_2 = Mechanic.create!(name: 'mechanic_2', years_experience: 2)
    # @mechanic_3 = Mechanic.create!(name: 'mechanic_3', years_experience: 3)
  end

  it 'lists mechanic info and average years experience' do
  visit "/mechanics"

  expect(page).to have_content("All Mechanics")
  expect(page).to have_content(@mechanic_1.name)
  expect(page).to have_content(@mechanic_1.years_experience)
  expect(page).to have_content(@mechanic_2.name)
  expect(page).to have_content(@mechanic_2.years_experience)
  expect(page).to have_content('1.5')
end
end
