require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:rides) }
    it { should have_many(:mechanics_rides)}
    it { should have_many(:rides)}
  end

  describe 'class methods' do
    let!(:larry){Mechanic.create!(name: "Larry", years_experience: 9)}
    let!(:george){Mechanic.create!(name: "George", years_experience: 3)}
    let!(:carol){Mechanic.create!(name: "Carol", years_experience: 12)}

    it '#average_years' do
      mechs = Mechanic.all
      expect(mechs.average_years).to eq 8
    end
  end
end
