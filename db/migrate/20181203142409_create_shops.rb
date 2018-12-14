class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :commercial_name
      t.string :legal_name
      t.string :company_number
      t.string :address

      t.timestamps
    end
  end
end
