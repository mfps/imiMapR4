class OverviewController < ApplicationController
  before_action :authorize
  before_action :get_programming_languages, :get_orientations

  def index
    @internships = Internship.includes(:company, :semester, :orientation, :programming_languages, :internship_rating).where(completed: true).order('created_at DESC')
    
    @companies = @internships.map(&:company)

    @pins = Gmaps4rails.build_markers(@companies) do |company, marker |
      marker.lat company.latitude
      marker.lng company.longitude
      # marker.infowindow ("<a href='/internships/#{company.internships.first.id}>hmmmm</a>")
      #marker.infowindow render_to_string(:partial => '/partials/rating_overview', :locals => { :company => company})
      marker.infowindow ("
        <div class='googleInfoWindow'>
          <a href='/internships/#{company.internships.first.id}' style='font-weight:bold'>
            <h3>#{company.internships.first.title}</h3>
            <p>#{company.internships.first.orientation.name.upcase}</p>
          </a>
          <small>erstell von: #{company.internships.first.try(:student).try(:name)} am #{(company.internships.first.updated_at).strftime("%m/%d/%Y")}</small>
        </div>
      ")
    end
    @favorites = current_user.favorites
    @programming_languages = ProgrammingLanguage.order(:name).where(:id => (Internship.joins(:programming_languages).select(:programming_language_id).collect do |x| x.programming_language_id end).uniq)

    @semesters = @internships.map(&:semester)

    @orientations_ary = @internships.map(&:orientation).compact.uniq

    @orientations = @orientations_ary.map { |o| [o.name, o.id] }

    @countries = @companies.map(&:country).compact.uniq


    @counts = @companies.map(&:country).group_by{|i| i}.map{|k,v| [k, v.count] }
    @data_country = []
    @countries.each do |x|
      @data_country << {:name=>x, :count=>@countries.map.count(x)}
    end

    #@countrylist = [["United States", 1],["Australia", 2], ["Egypt", 1], ["South Africa", 1],["Switzerland", 1]]

    
    @data_language = []
    @programming_languages.each do |x|
      s = x.try(:internships).try(:size)
      if s > 0
        @data_language << {:name=>x.name, :count=>s.to_f/@internships.size*100}
      end
    end

    

    @data_orientation = []
    @orientations_ary.each do |x|
      @data_orientation << {:name=>x.name, :count=>@orientations_ary.count(x)}
    end

    respond_to do |format|
      format.html
      format.js
    end
  end


end
