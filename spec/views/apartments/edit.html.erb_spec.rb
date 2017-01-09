require 'rails_helper'

RSpec.describe "apartments/edit", type: :view do
  before(:each) do
    @apartment = assign(:apartment, Apartment.create!(
      :address_1 => "MyString",
      :address_2 => "MyString",
      :city => "MyString",
      :zip => 1,
      :state => "MyString",
      :country => "MyString",
      :name => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders the edit apartment form" do
    render

    assert_select "form[action=?][method=?]", apartment_path(@apartment), "post" do

      assert_select "input#apartment_address_1[name=?]", "apartment[address_1]"

      assert_select "input#apartment_address_2[name=?]", "apartment[address_2]"

      assert_select "input#apartment_city[name=?]", "apartment[city]"

      assert_select "input#apartment_zip[name=?]", "apartment[zip]"

      assert_select "input#apartment_state[name=?]", "apartment[state]"

      assert_select "input#apartment_country[name=?]", "apartment[country]"

      assert_select "input#apartment_name[name=?]", "apartment[name]"

      assert_select "input#apartment_phone[name=?]", "apartment[phone]"
    end
  end
end
