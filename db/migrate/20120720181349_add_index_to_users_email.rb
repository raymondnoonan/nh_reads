class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	add_index :users, :organization, unique: true
  end
end
