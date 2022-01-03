require 'rails_helper'

RSpec.describe Mechanic do

  before do
    @frank = Mechanic.create!(name: "Frank", years_experience: 5)
    @kara = Mechanic.create!(name: "Kara", years_experience: 15)
  end

  describe 'relationships' do
    it { should have_many(:rides) }
    it { should have_many(:ride_mechanics) }
  end

  describe 'methods' do
    it '#average_years' do
      expect(Mechanic.average_years).to eq(10)
    end
  end
end
