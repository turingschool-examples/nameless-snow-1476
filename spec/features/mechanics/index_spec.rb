require 'rails_helper'

RSpec.describe 'Mechanic index page' do

  it 'can show all mechanics and their information' do
    mechanic_1 = Mechanic.create!(name: 'Mechanic 1', years_experience: 4)
    mechanic_2 = Mechanic.create!(name: 'Mechanic 2', years_experience: 5)
    mechanic_3 = Mechanic.create!(name: 'Mechanic 3', years_experience: 6)

    visit '/mechanics'
    expect(page).to have_content('All Mechanics')
    expect(page).to have_content('Mechanic 1')
    expect(page).to have_content('Mechanic 2')
    expect(page).to have_content('Mechanic 3')
    expect(page).to have_content('Years of experience: 4')
    expect(page).to have_content('Years of experience: 5')
    expect(page).to have_content('Years of experience: 6')


    save_and_open_page


  end

end
