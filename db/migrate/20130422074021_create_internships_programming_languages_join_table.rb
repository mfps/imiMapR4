class CreateInternshipsProgrammingLanguagesJoinTable < ActiveRecord::Migration
  	def change
	    create_table :internships_programming_languages, :id => false do |t|
	      t.integer :programming_language_id
	      t.integer :internship_id
    	end
  	end

  	def change
  		add_index(:internships_programming_languages, [:programming_language_id, :internship_id], :unique => true, :name => 'unique_index')
	end
end
