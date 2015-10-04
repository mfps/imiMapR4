class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :last_name
      t.string   :first_name
      t.string   :major
      t.string   :email
      t.string   :role
      t.string   :password_reset_token
      t.datetime :password_reset_sent_at
      t.string   :auth_token

      t.timestamps
    end
  end
end
