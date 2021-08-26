class CarsController < ApplicationController
	before_action :requiredata


# nethttp.rb
	def index
		uri = URI('http://localhost:3000/api/v1/cars')
		res = Net::HTTP.get_response(uri)
		jsresponse = res.body if res.is_a?(Net::HTTPSuccess)
		# @users = jsresponse
		# @users = ActiveSupport::JSON.decode(jsresponse)
		carsJson = ActiveSupport::JSON.decode(jsresponse)
		# @cars = carsJson
		@cars = []
		carsJson.each do |car_j|
			@cars << OpenStruct.new(car_j)
		end


		# response = HTTPX.get("http://localhost:3000/api/v1/users")
		# @users = response.body if response.status == 200
	end
	
	def show
		#http://localhost:3000/api/v1/distributors/1
		uri = URI('http://localhost:3000/api/v1/cars/' + params[:id])
		res = Net::HTTP.get_response(uri)
		jsresponse = res.body if res.is_a?(Net::HTTPSuccess)

		@distributor = jsresponse
		distributorJson = ActiveSupport::JSON.decode(jsresponse)
		# @distributor = []
		# distributorJson.each do |distributor_j|
		@distributor = OpenStruct.new(distributorJson)
		# end
	end

	private

	def requiredata
		require 'json'
		require 'uri'
		require 'net/http'
	end
end
