class AddPriceAndQuantityToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :quantity, :integer
    add_column :products, :price, :decimal, precision: 10, scale: 2
  end
end
