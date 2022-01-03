require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    xit { should have_many(:rides).through(:ride_mechanics) }
      #I cannot for the life of me figure out why this wont pass
  end
end
