class AddOrderIdToLabel < ActiveRecord::Migration
  def change
    add_column :labels, :order_id, :integer
  end
end
