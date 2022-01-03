require "rails_helper"

RSpec.describe Mechanic do
  describe "validations" do
    it { should validate_presence_of :names}
    it { should validate_presence_of :years}
  end
end
