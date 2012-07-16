class AddDestinationToOrders < ActiveRecord::Migration
  def up
  	change_table :orders do |t|
  		t.string :destination, :default => ""
  	end
  end

  def down
  	remove_column :orders, :destination
  end
end
