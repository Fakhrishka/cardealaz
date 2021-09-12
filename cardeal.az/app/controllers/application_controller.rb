class ApplicationController < ActionController::Base
	helper_method :logged_in?

	def logged_in?
		session[:login].present? && session[:token].present?
	end

end
