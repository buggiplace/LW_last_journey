class ChangeDeathDateInObituary < ActiveRecord::Migration[6.0]
  def change
    change_column :obituaries, :death_date, :date
  end
end
