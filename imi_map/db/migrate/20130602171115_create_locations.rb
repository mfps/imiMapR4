class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :street
      t.string :zip
      t.string :country
      t.string :city
      t.integer :company_id

      t.timestamps
    end
  end
end
