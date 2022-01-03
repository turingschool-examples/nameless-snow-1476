require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:ride_mechanics) } 
    it { should have_many(:rides).through(:ride_mechanics) }
  end
end
