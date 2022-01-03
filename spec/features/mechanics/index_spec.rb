require 'rails_helper'

RSpec.describe 'mechanics index page', type: :feature do
  let!(:mechanic_1) { Mechanic.create!(name: 'name_1', years_experience: 1)}

  before(:each) { visit mechanics_path }

  describe 'view elements' do
    it 'should have a header saying All Mechanics' do
      expect(page).to have_css("h1", text: "All Mechanics")
    end
  end
end