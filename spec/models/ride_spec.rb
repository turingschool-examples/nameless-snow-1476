require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :thrill_rating }
  end

  describe 'class methods' do
    before(:each) do
      @mechanic_1 = Mechanic.create!(name: "Robin", years_experience: 12)
      @mechanic_2 = Mechanic.create!(name: "Daisy", years_experience: 20)
      @mechanic_3 = Mechanic.create!(name: "Richard", years_experience: 4)
    end

    it '#yoe_average' do #Years of Experience
      expect(Mechanic.yoe_average).to eq(12)
    end
  end
end
