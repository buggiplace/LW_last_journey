class CreateDigitalWills < ActiveRecord::Migration[6.0]
  def change
    create_table :digital_wills do |t|
      t.string :cancel_accounts, default: [], array: true
      t.boolean :facebook_obituary, default: false
      t.string :bank_account_1
      t.string :bank_account_2
      t.string :bank_account_3
      t.string :insurance_account_1
      t.string :insurance_account_2
      t.string :insurance_account_3
      t.string :hardware
      t.string :comment

      t.timestamps
    end
  end
end


