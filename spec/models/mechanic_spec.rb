require 'rails_helper'

RSpec.describe Mechanic do
  describe 'Class Methods' do
    it 'calculate average years experience of all mechanics' do

      mechanic_1 = Mechanic.create!(name: "Rob", years_experience: 7)
      mechanic_2 = Mechanic.create!(name: "Dana", years_experience: 15)
      mechanic_3 = Mechanic.create!(name: "Burt", years_experience: 20)

      expect(Mechanic.average_years_experience).to eq(14)
    end
  end
end
