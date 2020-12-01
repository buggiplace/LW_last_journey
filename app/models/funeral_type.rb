class FuneralType < ApplicationRecord
  has_one :funeral

  geocoded_by :address
  after_validation :geocode, if: :save_to_geocode?

  def address
    [loc_street, loc_zip, loc_city].compact.join(', ')
  end

  def save_to_geocode?
    will_save_change_to_loc_street? && will_save_change_to_loc_zip? && will_save_change_to_loc_city?
  end

# CATEGORIES = ["Burial", "Burial at sea", "Tree funeral", "Woodland burial", "Diamond burial", "Urn burial", "Sky burial", "Undecided"]
CATEGORIES = ["Cemetery burial", "Burial at sea", "Tree burial", "Forest burial", "Diamond cremation", "Urn cremeation", "Sky burial", "Undecided"]
end
