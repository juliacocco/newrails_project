class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :bar_code
      t.string :model
      t.string :brand
      t.string :category
      t.string :product_type
      t.string :specs
      t.float :average_rating

      t.timestamps
    end
  end
end
