class CreateFunerals < ActiveRecord::Migration[6.0]
  def change
    create_table :funerals do |t|
      t.references :playlist, null: false, foreign_key: true
      t.references :funeral_type, null: false, foreign_key: true
      t.references :digital_will, null: false, foreign_key: true
      t.references :obituary, null: false, foreign_key: true
      t.references :representative_profile, foreign_key: true
      t.string :representative_email
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end


