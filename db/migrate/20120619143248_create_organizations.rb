class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address_street
      t.string :address_town
      t.string :address_state

      t.timestamps
    end
  end
end
