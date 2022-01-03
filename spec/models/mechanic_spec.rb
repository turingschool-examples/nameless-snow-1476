require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relatiopnships' do
    it { should have_many(:rides) }
  end

end
