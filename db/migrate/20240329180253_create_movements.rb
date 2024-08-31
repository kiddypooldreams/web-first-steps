class CreateMovements < ActiveRecord::Migration[6.1]
  def change
    create_table :movements do |t|
      t.string :movements_type
      t.text :details

      t.timestamps
    end
  end
end
