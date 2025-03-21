class AddStatusToEvents < ActiveRecord::Migration[8.1]
  def change
    add_column :events, :status, :integer
  end
end
