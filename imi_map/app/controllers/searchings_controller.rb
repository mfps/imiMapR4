class SearchingsController < ApplicationController

	def new
		@search = Searching.new
		@internships = Internship.all
		@orientations = Orientation.uniq.collect { |o| [o.name, o.id] }
		@programming_languages = ProgrammingLanguage.order(:name).where(:id => (Internship.joins(:programming_languages).select(:programming_language_id).collect do |x| x.programming_language_id end).uniq).map do |p| [p.name, p.id] end
		@companies = @internships.collect do |x| x.company end
    	@countries = @companies.collect do |x| x.country end.uniq
  	    @semesters = Semester.where(:id =>(@internships.collect do |x| x.semester_id end.uniq)).map do |s| [s.name, s.id] end
	    @orientations = (Orientation.where(:id => @internships.collect do |x| x.orientation_id end)).uniq.map do |o| [o.name, o.id] end
	    @living_costs_max = @internships.collect do |x| x.living_costs end.max
	    @salary_max = @internships.collect do |x| x.salary end.max	
			

	end

	def create
		@search = Searching.create(search_params)
		#redirect_to @search
	end

	def show
		@search = Searching.find(params[:id])
	end

	private
	def search_params
		params.require(:search).permit(:working_hours, :internship_rating, :company, :user, :title, :orientation, :description, :semester, :salery, :tasks, :language, :trainingsuccess, :atmosphere, :supervision, :appreciation)		
	end

end
