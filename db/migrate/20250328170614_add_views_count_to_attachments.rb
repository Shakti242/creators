class AddViewsCountToAttachments < ActiveRecord::Migration[8.1]
  def change
    add_column :active_storage_attachments, :views_count, :integer, default: 0
  end
end
