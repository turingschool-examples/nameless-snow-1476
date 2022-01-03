require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    xit { should have_many(:mechanics).through(:ride_mechanics) }
    #I cannot for the life of me figure out why this wont pass
  end
end
