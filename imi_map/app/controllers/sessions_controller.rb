class SessionsController < ApplicationController
  layout 'sessions'

  def new

    if current_user 
      redirect_to overview_index_url
    end

    @internships = Internship.includes(:company, :semester, :orientation, :programming_languages).where(completed: true)

    @companies = @internships.collect do |i| i.company end

    @pins = Gmaps4rails.build_markers(@companies) do |company, marker |
      marker.lat company.latitude
      marker.lng company.longitude
    end
  end


  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to overview_index_url, notice: "Logged in!"
    else
      flash[:alert] = t("msg.invalid")
      
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :alert =>  t("msg.logout")
  end
  
end
