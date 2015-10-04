ActiveAdmin.register Internship do
	filter :student_enrolment_number, :as => :select, :collection => proc { Student.all.map(&:enrolment_number).uniq }, :label => "Matrikel"
  filter :reading_prof
  filter :semester
  filter :completed
  action_item only: :new do
    link_to 'New Company', "/admin/companies/new"
  end

	index do
    column :student
    column "Enrolment Number", :student do |n|
      link_to n.enrolment_number, "/admin/students/#{n.student_id}"
    end
    column :company, :sortable => :company
    column :semester, :sortable => :semester
    column "to Prof", :certificate_to_prof, :sortable => :certificate_to_prof do |date| date.certificate_to_prof.strftime('%d.%m.%Y') end
    column "Signed by Prof", :certificate_signed_by_prof, :sortable => :certificate_signed_by_prof do |date| date.certificate_signed_by_prof.strftime('%d.%m.%Y') end
    column "Signed by Internship Officer", :certificate_signed_by_internship_officer, :sortable => :certificate_signed_by_internship_officer do |date| date.certificate_signed_by_internship_officer.strftime('%d.%m.%Y') end
    column :report_state, :sortable => :report_state
    column :certificate_state, :sortable => :certificate_state
    column :reading_prof, :sortable => :reading_prof
    column :completed
    actions
  end


  form do |f|
    f.inputs "Student" do 
      f.input :student_id, as: :select, collection: Student.order(:last_name).collect { |s| ["#{s.enrolment_number}, #{s.last_name}, #{s.first_name}", s.id] }
    end
    f.inputs "Company" do 
      f.input :company_id, as: :select, collection: Company.order(:name).collect { |c| ["#{c.name}, #{c.street} #{c.city} #{c.zip} - #{c.country}", c.id] }
    end
    f.inputs "Internship" do
      f.input :start_date, :as => :date_picker
      f.input :end_date, :as => :date_picker
      f.input :operational_area, as: :select, collection: Orientation.order(:name).collect { |s| [s.name, s.id] }
      f.input :tasks
      f.input :supervisor_name
      f.input :supervisor_email
    end
    f.inputs "Administration" do
      f.input :semester_id, label: "Semester", as: :select, collection: Semester.order(:name).collect { |s| [s.name, s.id] }
      f.input :registration_state_id, label: "Registration", as: :select, collection: RegistrationState.order(:name).collect { |rs| [rs.name, rs.id] }
      f.input :payment_state_id, label: "Payment", as: :select, collection: PaymentState.order(:name).collect { |ps| [ps.name, ps.id] }
      f.input :contract_state_id, label: "Contract", as: :select, collection: ContractState.order(:name).collect { |cs| [cs.name, cs.id] }
      f.input :report_state_id, label: "Report", as: :select, collection: ReportState.order(:name).collect { |rs| [rs.name, rs.id] }
      f.input :certificate_state_id, label: "Certificate", as: :select, collection: CertificateState.order(:name).collect { |cs| [cs.name, cs.id] }
      f.input :reading_prof_id, label: "Certficate reading prof", :as => :select, :collection => ReadingProf.order(:name).collect { |p| [p.name, p.id] }
      f.input :certificate_to_prof, :as => :date_picker, :input_html => { :style => 'width:69%', :min => "1980-01-01", :max => DateTime.now }, :local => true
      f.input :certificate_signed_by_prof, :as => :date_picker, :input_html => { :style => 'width:69%', :min => "1980-01-01", :max => DateTime.now }, :local => true
      f.input :certificate_signed_by_internship_officer, :as => :date_picker, :input_html => { :style => 'width:69%', :min => "1980-01-01", :max => DateTime.now }, :local => true
      f.input :internship_state, as: :select, collection: InternshipState.order(:name).collect { |is| [is.name, is.id] }
      f.input :comment
      f.input :completed
      f.actions
    end

  end

  

  show do |ad|
      attributes_table do
        row :student do |n|
          link_to n.enrolment_number, "/admin/students/#{n.student_id}"
        end
        row :company
        row :start_date
        row :end_date
        row :operational_area
        row :tasks
        row :supervisor_name
        row :supervisor_email
        row :semester
        row :registration_state
        row :payment_state
        row :contract_state
        row :report_state
        row :certificate_state
        row :reading_prof
        row :certificate_to_prof
        row :certificate_signed_by_prof
        row :certificate_signed_by_internship_officer
        row :internship_state
        row :comment
        row :completed
      end
      active_admin_comments
    end

end
