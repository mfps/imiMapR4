ActiveAdmin.register ReadingProf do
  menu parent: "Backoffice"
  filter :name
	
	index do
		column :name
    column :internships do |n|
      a = n.internships.map(&:id)
      str = ""
      a.each do |x|
        str += link_to x, "/admin/internships/#{x}"
      end
      str.html_safe
    end
    column "by Semster", :internships do |n|
      a = n.internships.includes(:semester).map(&:semester).map(&:name).group_by{|i| i}.map{|k,v| [k, v.count] }
      str = ""
      a.each do |x|
        str =  x
      end
    end
    actions
	end


end
