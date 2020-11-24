class AddRepresentativeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :representative, :boolean, default: false
  end
end
