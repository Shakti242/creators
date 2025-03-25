class AddExternalAccountIdToAccounts < ActiveRecord::Migration[8.1]
  def change
    add_column :accounts, :external_account_id, :string
  end
end
