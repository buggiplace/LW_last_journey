class CreateRepresentativeProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :representative_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :comment
      t.string :email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
