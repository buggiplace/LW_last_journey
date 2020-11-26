class Location < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :save_to_geocode?

  def address
    [street, zip, city].compact.join(', ')
  end

  def save_to_geocode?
    will_save_change_to_street? && will_save_change_to_zip? && will_save_change_to_city?
  end
end
