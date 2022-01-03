require 'rails_helper'

RSpec.describe Mechanic do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :years_of_experience}
  end


  describe 'relationships' do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe "Model Methods" do

    it '#average_years_of_experience' do
      mechanic1 = Mechanic.create!(name: 'mechanic1', years_of_experience: 1)
      mechanic2 = Mechanic.create!(name: 'mechanic2', years_of_experience: 2)
      mechanic3 = Mechanic.create!(name: 'mechanic3', years_of_experience: 3)

      expect(Mechanic.average_years_of_experience).to eq(2)
    end
  end
end
