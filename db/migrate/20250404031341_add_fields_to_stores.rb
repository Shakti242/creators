class AddFieldsToStores < ActiveRecord::Migration[7.1]
  def change
    add_column :stores, :name, :string
    add_column :stores, :domain, :string
    # If you want to change a column type, you can use:
    # change_column :stores, :subdomain, :string, limit: 100
  end
end
