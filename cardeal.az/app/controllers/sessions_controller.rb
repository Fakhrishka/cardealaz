class SessionsController < ApplicationController
	def create
		uri = URI('http://localhost:3000/api/v1/sessions')
		res = Net::HTTP.post_form(uri, 'login' => params[:login], 'password' => params[:password])
		jsresponse = res.body if res.is_a?(Net::HTTPSuccess)

		sessionJson = ActiveSupport::JSON.decode(jsresponse)
		sessions = OpenStruct.new(sessionJson)

		puts sessions

		session[:brand_id] = sessions[:brand_id]
		session[:login] = sessions[:login]
		session[:token] = sessions[:token]
		session[:type] = sessions[:type]

		redirect_to root_path, notice: 'Welcome!'

		# if user = User.authenticate(params[:login], params[:password])
		# 	session[:user_id] = user.id
		# 	puts 'DONE BABY DONE!'
		# 	redirect_to root_path, notice: 'Logged in!'
		# else
		# 	flash.now[:alert] = "Invalid login/password combination"
		# 	render :new
		# end



	end

	def destroy
		reset_session
		redirect_to root_path, notice: 'Logged out'
	end
end
