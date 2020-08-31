require 'rails_helper'

RSpec.describe 'Find parks feature on welcome index page' do
  describe 'As a user' do
    before :each do

    end

    it "returns a list of parks including their name, description, direction info and standard hours of operation" do
      visit root_path
      select 'Tennessee', from: :state
      click_on 'Find Parks'
      expect(page).to have_content("Total Number of Parks Found: 16")
      park = ParkResults.new.find_parks('TN').first
      within('.parks') do
        expect(page).to have_content("Park Name: #{park.name}")
        expect(page).to have_content("Description: #{park.description}")
        expect(page).to have_content("Direction Info: #{park.directions.squish!}")
        expect(page).to have_content("Hours of Operation: Monday: #{park.hours['monday']}")
      end
    end
  end
end
