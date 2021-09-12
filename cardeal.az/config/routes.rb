Rails.application.routes.draw do
	root to: "cars#index"

	resources :distributors
	resources :test_drives
	resources :services
	resources :cars  do
		member do
			get 'mycars'
		end
	end


	get "/dealer", to: "cars#dealercars", as: "dealercars"
	# do
	# 	get :dealcars, on: :collection
	# end
	resources :brands
	resource :session



	# get "/brandcars", to: "brands#getCarsByBrand", as: "brandcars"

	# get "/mycars", to: "cars#dealcars", as: "brandcarsss"

	get "/login", to: "sessions#new", as: "login"
	get "/logout", to: "sessions#destroy", as: "logout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
