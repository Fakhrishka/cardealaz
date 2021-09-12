Rails.application.routes.draw do

  devise_for :users
	namespace :api do
		namespace :v1 do
			resources :distributors
			resources :brands
			resources :services
			resources :cars
			resources :test_drives
			resources :sessions, only: [:create, :destroy]

			resources :cars  do
				member do
					get 'mycars'
				end
			end

			get "/dealercars", to: "cars#dealercars", as: "dealercars"
			get "/mycars", to: "cars#dealcars", as: "brandcars"
			# get "/brandcars", to: "cars#getCarsByBrand", as: "brandcars"
		end
	end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



# URL: localhost:3000/api/v1/cars 
# Response
    # "BMW": [
    #     {
    #         "id": 3,
    #         "brand_id": 2,
    #         "model": "X5",
    #         "test_drive": 0,
    #         "created_at": "2021-09-05T15:42:39.750Z",
    #         "updated_at": "2021-09-09T01:17:02.656Z",
    #         "startprice": 89000
    #     }
# 

# 
# 
# 
# 