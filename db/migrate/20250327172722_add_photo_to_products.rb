class AddPhotoToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :photo, :string
  end
end
