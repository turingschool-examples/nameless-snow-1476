require "rails_helper"

RSpec.describe Mechanic do
  describe "validations" do
    it { should validate_presence_of :names}
    it { should validate_presence_of :years}
  end

  describe 'relationships' do
    it { should have_many :mechanic_rides}
    it { should have_many(:rides).through(:mechanic_rides)}
  end

  describe "class methods" do
    it '.avg_years' do
      karen = Mechanic.create!(names: "Karen Smith", years: 11)
      bob = Mechanic.create!(names: "Bob Smith", years: 10)
      max = Mechanic.create!(names: "Max Smith", years: 9)

      expect(Mechanic.avg_years).to eq(10)
    end
  end
end
