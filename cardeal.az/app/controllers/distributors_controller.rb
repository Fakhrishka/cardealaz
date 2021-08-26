class DistributorsController < ApplicationController
	before_action :requiredata


# nethttp.rb
	def index
		require 'json'
		uri = URI('http://localhost:3000/api/v1/distributors.json')
		res = Net::HTTP.get_response(uri)
		jsresponse = res.body if res.is_a?(Net::HTTPSuccess)
		# @users = jsresponse
		# @users = ActiveSupport::JSON.decode(jsresponse)
		distributorsJson = ActiveSupport::JSON.decode(jsresponse)
		@distributors = []
		distributorsJson.each do |distributor_j|
			@distributors << OpenStruct.new(distributor_j)
		end
		# response = HTTPX.get("http://localhost:3000/api/v1/users")
		# @users = response.body if response.status == 200
	end
	
	def show
		#http://localhost:3000/api/v1/distributors/1
		uri = URI('http://localhost:3000/api/v1/distributors/' + params[:id])
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
		require 'uri'
		require 'net/http'
	end
end
