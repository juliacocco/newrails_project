class AddRatingToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :rating, :integer, default: 0
  end
end
