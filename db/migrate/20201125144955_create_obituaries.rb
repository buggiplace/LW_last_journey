class CreateObituaries < ActiveRecord::Migration[6.0]
  def change
    create_table :obituaries do |t|
      t.string :last_words
      t.string :spotify_list
      t.datetime :death_date
      t.string :death_location
      t.datetime :funeral_time
      t.string :funeral_location
      t.string :funeral_info

      t.timestamps
    end
  end
end
