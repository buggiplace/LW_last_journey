class CreateCondolences < ActiveRecord::Migration[6.0]
  def change
    create_table :condolences do |t|
      t.string :first_name
      t.string :last_name
      t.string :content
      t.references :funeral, null: false, foreign_key: true

      t.timestamps
    end
  end
end
