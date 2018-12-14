class AddNumbervoteToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :numbervote, :integer , default: 10
  end
end
