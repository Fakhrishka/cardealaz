Rails.application.routes.draw do

  devise_for :users
	namespace :api do
		namespace :v1 do
			resources :distributors
			resources :brands
			resources :cars
			resources :test_drives
			resources :sessions, only: [:create, :destroy]

			resources :cars  do
				member do
					get 'mycars'
				end
			end

			get "/mycars", to: "cars#dealcars", as: "brandcars"
			# get "/brandcars", to: "cars#getCarsByBrand", as: "brandcars"
		end
	end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



# 
# 
# 
# 
# 
# 