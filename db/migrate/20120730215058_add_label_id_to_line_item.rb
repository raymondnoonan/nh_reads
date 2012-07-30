class AddLabelIdToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :label_id, :integer
  end
end
