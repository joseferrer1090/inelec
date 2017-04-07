class CreatePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.integer :level
      t.references :section, foreign_key: true

      t.timestamps
    end
  end
end
