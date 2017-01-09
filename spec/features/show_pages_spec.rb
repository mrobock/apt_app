require 'rails_helper'

RSpec.feature "ShowPages", type: :feature do
  context "Landing Page" do
    Steps "Going to Landing page" do
      Given "I am on the root page" do
        visit "/"
      end
      Then "I can see 'Hello'" do
        expect(page).to have_content("Hello")
      end
    end
  end
end
