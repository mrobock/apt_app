class Apartment < ActiveRecord::Base
  belongs_to :user
  geocoded_by :full_address
  after_validation :geocode
  validates :user, presence: true
  resourcify

  def full_address
    [address_1, city, state, country].compact.join(', ')
  end
end
