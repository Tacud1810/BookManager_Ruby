class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]

	def new
		@user = User.new
	end
		
	def show
		@books = Book.all
	end	

	def index
		@users = User.all
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_username] = Base64.encode64(@user.username)
			flash[:notice] = "Welcome to the Alpha blog #{@user.username}, you have succesfully signed up."
			redirect_to books_path
		else 
			render 'new', status: :unprocessable_entity	
		end	
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:notice] = "Your account was updated."
			redirect_to books_path
		else
			render 'edit', status: :unprocessable_entity
		end	
	end	

	
	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

	def set_user
		if session[:user_username]
			decoded_username = Base64.decode64(session[:user_username])
			@user = User.find_by(username: decoded_username)
		else
			redirect_to root_path
		end
	end

end