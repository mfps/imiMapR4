class CreateInternships < ActiveRecord::Migration
  def change
    create_table :internships do |t|
      t.string :orientation
      t.integer :salary_id
      t.float :working_hours
      t.float :living_costs
      t.integer :internship_rating_id
      t.integer :user_id
      t.integer :company_id
      t.boolean :recommend
      t.string :title
      t.boolean :email_public
      t.string :internship_report
      t.text :description
      t.string :semester
      t.integer :semester_id
      t.date :start_date
      t.date :end_date
      t.text :tasks
      t.string :operational_area
      t.integer :student_id
      t.integer :internship_state_id
      t.integer :reading_prof_id
      t.integer :payment_state_id
      t.integer :registration_state_id
      t.integer :contract_state_id
      t.integer :report_state_id
      t.integer :certificate_state_id
      t.date :certificate_signed_by_internship_officer
      t.date :certificate_signed_by_prof
      t.date :certificate_to_prof
      t.string :comment
      t.string :supervisor_email
      t.string :supervisor_name
      t.boolean :completed, :default => false

      t.timestamps
    end
  end
end
