class TestDrivesController < ApplicationController

	def new
  		@tdrive = TestDrive.new
	end

	def show
		uri = URI('http://localhost:3000/api/v1/test_drives/' + params[:id])
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
			@tdrives = ActiveSupport::JSON.decode(response.body)
		end
	end

	def create
		puts params.inspect
		redirect_to root_path
	end
end
