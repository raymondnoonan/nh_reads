class AddNoteToLabel < ActiveRecord::Migration
  def change
    add_column :labels, :note, :string
  end
end
