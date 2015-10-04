class AddStuffToSearchings < ActiveRecord::Migration
  def change
    add_column :searchings, :countries, :string
    add_column :searchings, :programming_languages, :string
    add_column :searchings, :livingcoast, :float
  end
end
