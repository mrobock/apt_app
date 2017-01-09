class Apartment < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  def address
    [address_1, city, state, country].compact.join(', ')
  end
end
