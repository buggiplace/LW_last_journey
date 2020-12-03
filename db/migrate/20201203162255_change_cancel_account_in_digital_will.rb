class ChangeCancelAccountInDigitalWill < ActiveRecord::Migration[6.0]
  def change
     change_column :digital_wills, :cancel_accounts, :string, default: ""
  end
end
