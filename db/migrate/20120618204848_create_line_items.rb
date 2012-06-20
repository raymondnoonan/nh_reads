class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.integer :quantity

      t.timestamps
    end
    add_index :line_items, :order_id
    add_index :line_items, :quantity
  end
end
