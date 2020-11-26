class AddCoordinatesToFuneralTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :funeral_types, :latitude, :float
    add_column :funeral_types, :longitude, :float
  end
end
