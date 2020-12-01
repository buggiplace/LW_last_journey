class AddPublicToObituaries < ActiveRecord::Migration[6.0]
  def change
    add_column :obituaries, :public, :boolean, default: false
  end
end
