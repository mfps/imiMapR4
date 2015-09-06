ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        #small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

  columns do
    column do
      panel "Countrys" do
        render 'partials/adminCharts/map_chart'
        render 'partials/adminCharts/pie_chart_countries'
      end
    end
  end
  columns do
    column do
      panel "Orientation" do
        render 'partials/adminCharts/pie_chart'
      end
    end 
=begin
    column do
      panel "Programming Languages" do
        render 'partials/adminCharts/pie_chart_programming_lang'
      end
    end
=end
    column do
      panel "Semesters" do
        render 'partials/adminCharts/line_chart_semester'
      end
    end
  end

  columns do
    column do
      panel "Reading Profs" do
        render 'partials/adminCharts/pie_chart_profs'
      end
    end
    column do
      panel "Report State" do
        render 'partials/adminCharts/pie_chart_reportstate'
      end
    end
    column do
      panel "Certificate State" do
        render 'partials/adminCharts/pie_chart_certificatestate'
      end
    end
  end



     columns do
       column do
         panel "Recent Internships" do
           ul do
             Internship.last(10).reverse.map do |internship|
               li link_to("#{internship.student.first_name} #{internship.student.last_name} at #{internship.company.name}", admin_internship_path(internship))
             end
           end
         end
       end

       column do
         panel "Recent Students" do
           ul do
             Student.last(10).reverse.map do |student|
               li link_to(student.first_name+" "+student.last_name, admin_student_path(student))
             end
           end
         end
       end

     end
  end # content
end
