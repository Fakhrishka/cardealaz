class Api::V1::SessionsController < ApplicationController
	def create
		if user = User.authenticate(params[:login], params[:password])
			#LOGGED IN!
			session[:user_id] = user.id
			puts 'DONE BABY DONE!'
			redirect_to root_path, notice: 'Logged in!'
		else
			flash.now[:alert] = "Invalid login/password combination"
			render :new
		end
end
