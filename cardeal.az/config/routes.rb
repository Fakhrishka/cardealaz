Rails.application.routes.draw do
	root to: "cars#index"


	resources :distributors
	resources :cars
	resources :brands
	resource :session


	get "/login", to: "sessions#new", as: "login"
	get "/logout", to: "sessions#destroy", as: "logout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
