ActiveAdmin.register Company do
  menu parent: "Companys"
    filter :internships_student_enrolment_number, :as => :select, :collection => proc { Student.all.map(&:enrolment_number).uniq }, :label => "Matrikel"
    filter :name
    filter :city
    filter :country

	index do
    column :internships do |n|
      a = n.internships.map(&:id)
      str = ""
      a.each do |x|
        str += link_to x, "/admin/internships/#{x}"
      end
      str.html_safe
    end
    column :name
    column :industry
    column :website
    column :address
    column :main_language
    column :phone
    column :fax
    column :blacklisted
    actions
  end

  form do |f|
    f.inputs "Student" do
      f.input :name
      f.input :number_employees
      f.input :industry
      f.input :website
      f.input :latitude
      f.input :longitude
      f.input :city
      f.input :country, as: :select, collection: ActionView::Helpers::FormOptionsHelper::COUNTRIES 
      f.input :street
      f.input :zip
      f.input :main_language
      f.input :phone
      f.input :fax
      f.input :blacklisted
      actions
    end
  end



	show do |company|
    attributes_table do
     	row :id
     	row :name
     	row :number_employees
     	row :industry
     	row :website
     	row :city
     	row :country
     	row :street
     	row :zip
     	row :main_language
     	row :phone
     	row :fax
     	row :blacklisted
  		row :internships do |n|
		    a = company.internships.map(&:id)
		    str = ""
		    a.each do |x|
		   		str += link_to x, "/admin/internships/#{x}"
		   		str += "<br/>"
		    end
		    str.html_safe
		  end
		end
	end
end
