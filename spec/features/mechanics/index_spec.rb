require 'rails_helper'

RSpec.describe 'the mechanics index page' do

  before :each do
    @mechanic_1 = Mechanic.create!(name: 'Joe', years_experience: 5)
    @mechanic_2 = Mechanic.create!(name: 'Alan', years_experience: 10)
    @mechanic_3 = Mechanic.create!(name: 'Barb', years_experience: 15)
  end

  it 'displays info for all mechanics' do
    visit '/mechanics'

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_2.name)
    expect(page).to have_content(@mechanic_3.name)

    expect(page).to have_content(@mechanic_1.years_experience)
    expect(page).to have_content(@mechanic_2.years_experience)
    expect(page).to have_content(@mechanic_3.years_experience)
  end

  it 'displays average years experience' do
    visit 'mechanics'

    expect(page).to have_content("Average Experience: 10")
  end

end
