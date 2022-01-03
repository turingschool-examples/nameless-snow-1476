require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'class methods' do
    it ' calculates the average years of experience' do
      mechanic_1 = Mechanic.create!(name: "Ted", years_of_experience: 10)
      mechanic_2 = Mechanic.create!(name: "Meg", years_of_experience: 3)
      mechanic_3 = Mechanic.create!(name: "Bertha", years_of_experience: 6)

      average_years_of_experience = (mechanic_1.years_of_experience + mechanic_2.years_of_experience + mechanic_3.years_of_experience) / 3

      mechanics = Mechanic.all

      expect(mechanics.average_years_of_experience.round(2)).to eq(average_years_of_experience.round(2))
    end
  end

end
