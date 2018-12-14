class AddPhotoToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :photo, :string
  end
end
