class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.string :street
      t.string :zip
      t.string :city
      t.string :cemetery_type
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
