class ChangeFuneraltypeTypeToBurialType < ActiveRecord::Migration[6.0]
  def change
      rename_column :funeral_types, :type, :burial_type
  end
end
