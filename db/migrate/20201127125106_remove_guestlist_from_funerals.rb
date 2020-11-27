class RemoveGuestlistFromFunerals < ActiveRecord::Migration[6.0]
  def change
    remove_column :funerals, :guestlist
  end
end
