class ApplicationController < ActionController::API
	include ActionController::Helpers
	helper_method :tokenAuthorize

	def tokenAuthorize(params)
		user = User.find_by(:login => params[:login])

		if user && user.authentication_token == params[:token]
			return user
		end
		return false
	end
end
