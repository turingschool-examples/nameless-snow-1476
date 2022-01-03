require 'rails_helper'
RSpec.describe Mechanic, type: :model do
  it {should have_many :mechanic_rides}
  it {should have_many(:rides).through(:mechanic_rides)}

  it '#average_years' do
    seth = Mechanic.create!(name: 'Seth', years_experience: 1)
    joe = Mechanic.create!(name: 'Joe', years_experience: 2)
    brian = Mechanic.create!(name: 'Brian', years_experience: 3)

    expect(Mechanic.average_years).to eq(2)
  end
end
