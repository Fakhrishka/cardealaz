class Api::V1::SessionsController < ApplicationController
	def create
		user = User.where(email: params[:email]).first
		# user[:user_type] = user.user_info.user_type

		if user&.valid_password?(params[:password])
			userdata = 
			{
				:token => user.authentication_token,
				:email => user.email,
				:type => user.user_info.user_type
			}

			puts userdata
			render json: userdata.as_json, status: :created
		else
			head(:unauthorized)
		end
	end

	def destroy
	end
end
