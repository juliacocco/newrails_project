class RemovePriceFromOffer < ActiveRecord::Migration[5.2]
  def change
    remove_column :offers, :price, :integer
  end
end
