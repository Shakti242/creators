class AddEmailToCardholders < ActiveRecord::Migration[8.1]
  def change
    add_column :cardholders, :email, :string
  end
end
