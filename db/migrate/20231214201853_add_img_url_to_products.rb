class AddImgUrlToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :img_url, :string
  end
end
