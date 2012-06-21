class AddGenreToLineItem < ActiveRecord::Migration
  def up
  	change_table :line_items do |t|
  		t.string :genre, :default => ""
  	end
  end

  def down
  	remove_column :line_items, :genre
  end
end
