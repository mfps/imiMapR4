class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :street
      t.string :zip
      t.integer :number_employees
      t.string :industry
      t.string :website
      t.float :latitude
      t.float :longitude
      t.string :main_language
      t.integer :import_id
      t.string :phone
      t.string :fax
      t.boolean :blacklisted, :default => false
      t.timestamps
    end
  end
end
