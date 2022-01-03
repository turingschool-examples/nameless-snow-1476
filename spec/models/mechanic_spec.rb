require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe '::average_exp' do
    it 'calculates the average years of experience for all mechanics' do
    end
  end 
end
