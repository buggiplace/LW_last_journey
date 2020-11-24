class CreateFunerals < ActiveRecord::Migration[6.0]
  def change
    create_table :funerals do |t|
      t.json :preferences
      t.json :guests
      t.string :representative_email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
