class AddGuestlistToFunerals < ActiveRecord::Migration[6.0]
  def change
    add_column :funerals, :guestlist, :string, default: [], array: true
  end
end
