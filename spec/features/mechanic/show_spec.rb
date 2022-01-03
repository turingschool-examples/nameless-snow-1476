require 'rails_helper'

RSpec.describe 'mechanic show page' do

  before :each do
    @park1 = AmusementPark.find_or_create_by!(name: 'Park1', admission_cost: '100')

    @mechanic1 = Mechanic.find_or_create_by!(name: 'Kara', yearsxp: 11)
    @mechanic2 = Mechanic.find_or_create_by!(name: 'Joe', yearsxp: 10)

    @ride1 = @mechanic1.rides.find_or_create_by!(name: 'ride1', thrill_rating: 0, open: false)
    @ride2 = @mechanic1.rides.find_or_create_by!(name: 'ride2', thrill_rating: 1, open: false)

    @ride3 = @mechanic2.rides.find_or_create_by!(name: 'ride3', thrill_rating: 2, open: false)
    @ride4 = @mechanic2.rides.find_or_create_by!(name: 'ride4', thrill_rating: 3, open: false)
  end

  it 'shows an individual mechanics bio' do
    visit "mechanics/#{@mechanic1.id}"

    expect(page).not_to have_content('Joe')
    expect(page).to have_content('Kara')
    binding.pry
  end
end
