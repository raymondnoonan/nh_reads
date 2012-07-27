class AddSolicitorToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :solicitor, :string
  end
end
