require 'rails_helper'

RSpec.describe 'mechanic index page' do
  it 'displays all names on mechanic index' do
    mechanic1 = Mechanic.new(name: 'Kara', yearsxp: 11)
    mechanic2 = Mechanic.new(name: 'Joe', yearsxp: 10)

    visit "/mechanics"

    expect(page).to have_content('Kara')
    expect(page).to have_content('Joe')
  end
end
