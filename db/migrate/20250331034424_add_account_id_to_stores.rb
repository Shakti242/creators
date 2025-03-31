class AddAccountIdToStores < ActiveRecord::Migration[8.1]
  def change
    add_column :stores, :account_id, :bigint
    add_index :stores, :account_id
  end
end
