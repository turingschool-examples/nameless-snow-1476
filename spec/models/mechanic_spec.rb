require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:rides) }
    it { should have_many(:ride_mechanics) }
  end
end
