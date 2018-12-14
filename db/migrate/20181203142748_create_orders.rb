class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :price_snapshot
      t.jsonb :payment_info
      t.references :offer, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
