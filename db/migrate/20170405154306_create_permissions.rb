class CreatePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.integer :level
      t.references :section
      t.references :role

      t.timestamps
    end
  end
end
