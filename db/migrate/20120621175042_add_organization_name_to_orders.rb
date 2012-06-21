class AddOrganizationNameToOrders < ActiveRecord::Migration
  def up
  	change_table :orders do |t|
  		t.string :organization_name, :default => " "
  	end
  end

  def down
  	remove_column :orders, :organization_name
  end
end
