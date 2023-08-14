class ApplicationController < ActionController::Base
		

	helper_method :current_user, :logged_in?
	def current_user
		@current_user ||= User.find_by(username: Base64.decode64(session[:user_username]))if session[:user_username]
	
	end

	def logged_in?
		!!current_user
	end

	def check_session
		if not session[:user_username]
			redirect_to root_path
		end
	end
end
