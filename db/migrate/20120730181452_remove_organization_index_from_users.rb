class RemoveOrganizationIndexFromUsers < ActiveRecord::Migration
  def change
  	remove_index :users, :organization
  end
end
