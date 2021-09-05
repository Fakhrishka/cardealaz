class CarsController < ApplicationController
	before_action :requiredata


# nethttp.rb
	def index
		@allcars = Car.getAllCars
	end
		
	def show
		#http://localhost:3000/api/v1/distributors/1
		@car = Car.showCar(params[:id])
		# end
	end

	def new
		@car = Car.new
	end

	# post
	def create
		uri = URI('http://localhost:3000/api/v1/cars')
		car = params[:car]

		req = Net::HTTP::Post.new(uri)
		req.set_form_data('brand_id' => car[:brand_id], 'model' => car[:model], 'test_drive' => car[:testdrive])

		res = Net::HTTP.start(uri.hostname, uri.port) do |http|
			http.request(req)
		end
		jsresponse = res.body if res.is_a?(Net::HTTPSuccess)


		carJson = ActiveSupport::JSON.decode(jsresponse)
		@car = OpenStruct.new(carJson)


		# @distributor = jsresponse
	end


	private

	def requiredata
		require 'json'
		require 'uri'
		require 'net/http'
	end
end
