require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'class methods' do
    describe 'avg_years_experience' do
      it 'returns the avg_years_experience of all mechanics if mechanics exist' do
        mech_1 = create(:mechanic, years_experience: 10)
        mech_1 = create(:mechanic, years_experience: 15)
        mech_1 = create(:mechanic, years_experience: 13)

        expect(Mechanic.avg_years_experience).to eq(12.67)
      end

      it 'returns nil if no mechanics exist' do
        expect(Mechanic.avg_years_experience).to eq(nil)
      end

    end
  end
end
