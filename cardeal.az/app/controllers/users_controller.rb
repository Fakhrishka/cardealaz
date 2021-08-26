class UsersController < ApplicationController
	before_action :requiredata


# nethttp.rb
	def index
		require 'json'
		uri = URI('http://localhost:3000/api/v1/users.json')
		res = Net::HTTP.get_response(uri)
		jsresponse = res.body if res.is_a?(Net::HTTPSuccess)
		# @users = jsresponse
		# @users = ActiveSupport::JSON.decode(jsresponse)
		userJson = ActiveSupport::JSON.decode(jsresponse)
		@users = []
		userJson.each do |user_j|
			@users << OpenStruct.new(user_j)
		end



		

		# response = HTTPX.get("http://localhost:3000/api/v1/users")
		# @users = response.body if response.status == 200
	end
	
	private

	def requiredata
		require 'uri'
		require 'net/http'
	end
end
