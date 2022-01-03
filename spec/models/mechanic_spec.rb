require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  before(:each) do
    @mech_1 = Mechanic.create!(name: "Joe Shmoe", years_experience: 9)
    @mech_2 = Mechanic.create!(name: "Jon Smith", years_experience: 20)
    @mech_2 = Mechanic.create!(name: "Jane Shmoe", years_experience: 16)
  end

  it 'shows the average years of experience of all mechanics' do
    expect(Mechanic.average_years).to eq(15)
  end
end
