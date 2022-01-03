require 'rails_helper'

RSpec.describe 'mechanic index page' do

  let!(:teddy) {Mechanic.create!(name: "Teddy Handyman", years_of_experience: 23)}
  let!(:bob) {Mechanic.create!(name: "Bob Belcher", years_of_experience: 3)}
  let!(:jim) {Mechanic.create!(name: "Jim Redman", years_of_experience: 35)}

  it "has a header that says 'All Mechanics' " do
  end

  it 'lists all mechanics names and years of experience' do
  end

  it 'displays the average years of experience for all mechanics' do
  end
end
