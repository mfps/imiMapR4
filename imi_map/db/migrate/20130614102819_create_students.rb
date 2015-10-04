class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :enrolment_number, unique: true
      t.string :last_name
      t.string :first_name
      t.date :birthday
      t.string :birthplace
      t.string :email
      t.integer :import_id

      t.timestamps
    end
  end
end
