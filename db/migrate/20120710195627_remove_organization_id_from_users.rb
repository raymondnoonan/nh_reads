class RemoveOrganizationIdFromUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :organization_id
  end

  def down
  end
end
