class AddUsersToProducts < ActiveRecord::Migration[8.1]
  def change
    add_reference :products, :user, null: false, foreign_key: true
  end
end
