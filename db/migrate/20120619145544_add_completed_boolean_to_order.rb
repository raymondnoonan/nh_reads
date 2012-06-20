class AddCompletedBooleanToOrder < ActiveRecord::Migration
  def up
  	change_table :orders do |t|
  		t.boolean :completed, :default => false
  	end
  end

  def down
  	remove_column :orders, :completed
  end
end
