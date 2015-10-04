class Searching < ActiveRecord::Base

	def search_internships
		
		internships = Internships.all

		internships = internships.where(["working_hours LIKE ?", working_hours]) if working_hours.present?
		internships = internships.where(["internship_rating LIKE ?", internship_rating]) if internship_rating.present?
		internships = internships.where(["company LIKE ?", company]) if company.present?
		internships = internships.where(["user_string LIKE ?", user_string]) if user_string.present?
		internships = internships.where(["title LIKE ?", title]) if title.present?
		internships = internships.where(["orientation LIKE ?", orientation]) if orientation.present?
		internships = internships.where(["description LIKE ?", description]) if description.present?
		internships = internships.where(["semester LIKE ?", semester]) if semester.present?
		internships = internships.where(["salery LIKE ?", salery]) if salery.present?
		internships = internships.where(["tasks LIKE ?", tasks]) if tasks.present?
		internships = internships.where(["language LIKE ?", language]) if language.present?
		internships = internships.where(["trainingsuccess LIKE ?", trainingsuccess]) if trainingsuccess.present?
		internships = internships.where(["atmosphere LIKE ?", atmosphere]) if atmosphere.present?
		internships = internships.where(["supervision LIKE ?", supervision]) if supervision.present?
		internships = internships.where(["appreciation LIKE ?", appreciation]) if appreciation.present?


		return internships
	end

end
