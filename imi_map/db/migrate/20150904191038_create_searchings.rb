class CreateSearchings < ActiveRecord::Migration
  def up
    create_table :searchings do |t|
      t.float :working_hours
      t.float :internship_rating
      t.string :company
      t.string :user_string
      t.string :title
      t.string :orientation
      t.string :description
      t.string :semester
      t.float :salery
      t.string :tasks
      t.string :language
      t.float :trainingsuccess
      t.float :atmosphere
      t.float :supervision
      t.float :appreciation
      t.string :countries
      t.string :programming_languages
      t.float :livingcoast
  end


      t.timestamps null: false
    end
  end

  def change
    add_column :countries, :programming_languages, :string
  
  end
end
