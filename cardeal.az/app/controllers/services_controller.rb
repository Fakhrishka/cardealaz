class ServicesController < ApplicationController
	before_action :requiredata


	def create
		# should we check for iflogged?

		uri = URI('http://localhost:3000/api/v1/services')
		puts 'LOLLLL'

		# new way
		http = Net::HTTP.new(uri.host, uri.port)

		data = 
		{ 
			'service' => 
			{
				'person' 	=> params[:person],
				'phone' 	=> params[:phone],
				'jobtype' 	=> params[:jobtype],
				'car' 		=> params[:car],
				'brand_id' 	=> params[:brand_id],
				'time' 		=> DateTime.new(params['time(1i)'].to_i, params['time(2i)'].to_i, params['time(3i)'].to_i),
			}
		}


		puts data
		request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})
		request.body = data.to_json

		response = http.request(request)

		if(response.kind_of? Net::HTTPSuccess)
			redirect_to root_path
		else
			puts 'Not done'
		end


		# @distributor = jsresponse
	end


	def show
		uri = URI('http://localhost:3000/api/v1/services/' + params[:id])
		# new way
		http = Net::HTTP.new(uri.host, uri.port)
		data = 
		{ 
			'session' =>
			{
				'token' => session[:token],
				'login' => session[:login]
			}
		}

		request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
		request.body = data.to_json

		response = http.request(request)
		puts response.body

		if(response.kind_of? Net::HTTPSuccess)
			@services = ActiveSupport::JSON.decode(response.body)
		end
	end


	def requiredata
		require 'json'
		require 'uri'
		require 'net/http'
	end
end
