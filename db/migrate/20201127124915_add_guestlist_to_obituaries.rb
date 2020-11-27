class AddGuestlistToObituaries < ActiveRecord::Migration[6.0]
  def change
    add_column :obituaries, :guestlist, :string, default: [], array: true
  end
end
