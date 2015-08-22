ImiMaps::Application.routes.draw do

  get "password_resets/new"

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do

    resources :internships, :only => [:edit, :show, :index, :destroy, :update]

    resources :companies

    resources :users

    resources :user_verifications

    resources :search, :only => [:index]

    resources :overview, :only => [:index]

    resources :internship_offer, :only => [:index, :show]

    resources :notifications, :only => [:destroy, :show]

    resources :favorite, :only => [:create, :destroy]

    resources :location, :only => [:create, :destroy]

    resources :sessions

    resources :user_comments

    resources :answers

    resources :general

    resources :faq

    resources :financing

    resources :download

    resources :internship_searches

    resources :quicksearches, :only => [:index]

    resources :companies_compare

    resources :favorite, :only => [:index]

    resources :favorite_compare

    resources :password_resets

    resources :errors, :only => [:not_found]

		#root to: 'sessions#new'

    get 'signup', to: 'users#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'

    get "*path", to: "errors#not_found"
    
	end

  root to: 'sessions#new'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  get '*path', to: redirect {|params| "/#{I18n.default_locale}/#{CGI::unescape(params[:path])}" }
	get '', to: redirect("/#{I18n.default_locale}/") , constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }

  
  get 'de', to: redirect("/de/sessions#new")
  get 'en', to: redirect("/en/sessions#new")
  get 'id', to: redirect("/id/sessions#new")
 
end
