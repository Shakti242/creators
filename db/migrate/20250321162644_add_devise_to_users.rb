# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[8.1]
  def change
    # Remove the email column if it already exists
    remove_column :users, :email if column_exists?(:users, :email)

    change_table :users, bulk: true do |t|
      ## Database authenticatable
      t.string :email, null: false, default: "" unless column_exists?(:users, :email)
      t.string :encrypted_password, null: false, default: "" unless column_exists?(:users, :encrypted_password)

      ## Recoverable
      t.string   :reset_password_token unless column_exists?(:users, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:users, :reset_password_sent_at)

      ## Rememberable
      t.datetime :remember_created_at unless column_exists?(:users, :remember_created_at)

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false unless column_exists?(:users, :sign_in_count)
      t.datetime :current_sign_in_at unless column_exists?(:users, :current_sign_in_at)
      t.datetime :last_sign_in_at unless column_exists?(:users, :last_sign_in_at)
      t.string   :current_sign_in_ip unless column_exists?(:users, :current_sign_in_ip)
      t.string   :last_sign_in_ip unless column_exists?(:users, :last_sign_in_ip)
    end

    ## Add indexes only if they do not exist
    add_index :users, :email, unique: true unless index_exists?(:users, :email)
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
  end
end
