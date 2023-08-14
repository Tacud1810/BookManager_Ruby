class SessionsController < ApplicationController

def new
end

def create
	user = User.find_by(email: params[:session][:email].downcase)
	if user and user.authenticate(params[:session][:password])
		session[:user_username] = Base64.encode64(user.username)
		flash[:notice] = "Přihlášení úspěšné"
		redirect_to user_path(user)
	else
		flash.now[:alert] = "Něco špatně s přihlašovacími údaji."
		render 'new', status: :unprocessable_entity	
	end	
end

def destroy
	session[:user_username] = nil
	flash[:notice] = "Odhlášení úspěšné"
	redirect_to root_path
end


end