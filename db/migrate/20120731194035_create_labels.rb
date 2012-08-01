class CreateLabels < ActiveRecord::Migration
  def change
  	drop_table :labels
    create_table :labels do |t|
      t.string :note, :default => ""
      t.integer :order_id

      t.timestamps
    end
  end
end
