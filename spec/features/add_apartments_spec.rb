require 'rails_helper'

RSpec.feature "AddApartments", type: :feature do
  context "Landing Page" do
    Steps "Going to Landing page" do
      Given "I am on the root page" do
        visit "/"
      end
      Then "I can see 'Hello'" do
        expect(page).to have_content("Hello")
      end
      Then "I can go to apartment listing page" do
        visit "/apartments"
        expect(page).to have_content("Listing Apartments")
      end
      Then "I can go make a new apartment" do
        visit "/apartments/new"
        fill_in "apartment[address_1]", with: "701 j st"
        fill_in "apartment[address_2]", with: "Apt 1"
        fill_in "apartment[city]", with: "san diego"
        fill_in "apartment[zip]", with: 92127
        fill_in "apartment[state]", with: "CA"
        fill_in "apartment[country]", with: "USA"
        fill_in "apartment[name]", with: "Apt 2"
        fill_in "apartment[phone]", with: "858-453-0678"
        select("08", from: "apartment[contact_hrs_from(4i)]")
        select("30", from: "apartment[contact_hrs_from(5i)]")
        select("06", from: "apartment[contact_hrs_to(4i)]")
        select("12", from: "apartment[contact_hrs_to(5i)]")
        click_button "Create Apartment"

        expect(page).to have_content("Apartment was successfully created")
        expect(page).to have_content("Apt 2")

      end
    end
  end
end
