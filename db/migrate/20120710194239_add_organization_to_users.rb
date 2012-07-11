class AddOrganizationToUsers < ActiveRecord::Migration
  def up
  	change_table :users do |t|
  		t.string :organization, :default => ""
  	end
  end

  def down
  	remove_column :users, :organization
  end
end
