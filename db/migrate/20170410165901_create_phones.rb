class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.string :number
      t.string :type_number
      t.boolean :primary
      t.string :country_code
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
