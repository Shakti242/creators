class AddAccountToStores < ActiveRecord::Migration[8.1]
  def change
    add_reference :stores, :account, null: false, foreign_key: true
  end
end
