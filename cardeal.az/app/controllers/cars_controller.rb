class CarsController < ApplicationController
	before_action :requiredata


# nethttp.rb
	def index
		@allcars = Car.getAllCars
	end

	def mycars
		@mycars = Car.getCarsByBrand(params[:id], session)
		puts @mycars
	end
		
	def show
		#http://localhost:3000/api/v1/distributors/1
		@car = Car.showCar(params[:id])
		# end
	end

	def new
		@car = Car.new
	end

	def destroy
		uri = URI('http://localhost:3000/api/v1/cars')
		puts params.inspect

		data = 
		{
			'session' =>
			{
				'token' => session[:token],
				'login' => session[:login]
			}
		}	

		Net::HTTP::Delete.new(path,{'Depth' => 'Infinity', 'foo' => 'bar'})		
	end

	# post
	def create
		# should we check for iflogged?

		uri = URI('http://localhost:3000/api/v1/cars')
		car = params[:car]

		# new way
		http = Net::HTTP.new(uri.host, uri.port)
		data = 
		{ 
			'car' => 
			{
				'model' => car['model'],
				'test_drive' => car['test_drive'],
				'brand_id' => car['brand_id']
			},
			'session' =>
			{
				'token' => session[:token],
				'login' => session[:login]
			}
		}

		request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})
		request.body = data.to_json

		response = http.request(request)

		if(response.kind_of? Net::HTTPSuccess)
			redirect_to mycars_car_path(session[:brand_id]), notice: 'Added successfully'
		else
			puts 'Not done'
		end


		# @distributor = jsresponse
	end


	private

	def requiredata
		require 'json'
		require 'uri'
		require 'net/http'
	end
end
