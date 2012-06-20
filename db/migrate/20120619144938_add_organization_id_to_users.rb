class AddOrganizationIdToUsers < ActiveRecord::Migration
  def up
  	change_table :users do |t|
  		t.integer :organization_id, :default => nil
  	end
  end
end
