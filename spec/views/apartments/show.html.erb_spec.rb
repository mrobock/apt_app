require 'rails_helper'

RSpec.describe "apartments/show", type: :view do
  before(:each) do
    @apartment = assign(:apartment, Apartment.create!(
      :address_1 => "Address 1",
      :address_2 => "Address 2",
      :city => "City",
      :zip => 2,
      :state => "State",
      :country => "Country",
      :name => "Name",
      :phone => "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address 1/)
    expect(rendered).to match(/Address 2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone/)
  end
end
