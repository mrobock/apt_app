require 'rails_helper'

RSpec.describe Apartment, type: :model do
  it 'is a thing' do
    expect{Apartment.new}.to_not raise_error
  end

  it 'can have all fields of an Apartment object' do
    a1 = Apartment.new({
      address_1: "123 Main St",
      address_2: "Apt 42",
      city: "San Diego",
      zip: "91915",
      state: "CA",
      country: "USA",
      name: "Cool Place",
      phone: "(619)555-5555",
      contact_hrs_from: "08:30",
      contact_hrs_to: "20:00"
    })
    expect(a1.save).to eq true

    a2 = Apartment.find_by_address_1("123 Main St")
    expect(a2.address_2).to eq "Apt 42"
    expect(a2.city).to eq "San Diego"
    expect(a2.zip).to eq 91915
    expect(a2.state).to eq "CA"
    expect(a2.country).to eq "USA"
    expect(a2.name).to eq "Cool Place"
    expect(a2.phone).to eq "(619)555-5555"
    expect(a2.contact_hrs_from).to eq a1.contact_hrs_from
    expect(a2.contact_hrs_to).to eq a1.contact_hrs_to
    expect(a2.full_address).to eq "123 Main St, San Diego, CA, USA"
  end
end
