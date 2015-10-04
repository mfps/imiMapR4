class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :internship_id
      t.boolean :comparebox
      t.timestamps
    end
  end
end
