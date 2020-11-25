class CreateFuneralTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :funeral_types do |t|
      t.string :type
      t.string :comment
      t.string :loc_street
      t.string :loc_zip
      t.string :loc_city

      t.timestamps
    end
  end
end
