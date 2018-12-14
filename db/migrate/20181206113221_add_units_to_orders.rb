class AddUnitsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :units, :integer, default: 1
  end
end
