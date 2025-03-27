class CreateAttachments < ActiveRecord::Migration[8.1]
  def change
    create_table :attachments do |t|
      t.references :product, null: false, foreign_key: true
      t.string :name
      t.string :file

      t.timestamps
    end
  end
end
