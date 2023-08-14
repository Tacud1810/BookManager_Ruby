class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
before_action :check_session, except: [:create, :new]
before_action :require_same_user, only: [:edit,  :update, :destroy]

	def new
		@user = User.new
	end
		
	def show
	end	

	def index
		@users = User.all
	end

	def create
		@user = User.new(user_params)
		if @user.save
			set_session
			flash[:notice] = "Welcome to the Book manager #{@user.username}, you have succesfully signed up."
			redirect_to books_path
		else 
			render 'new', status: :unprocessable_entity	
		end	
	end

	def edit
	end

	def update
		if @user.update(user_params)
			set_session if current_user == @user
			flash[:notice] = "Účet byl upraven."
			redirect_to @user
		else
			render 'edit', status: :unprocessable_entity
		end	
	end	

	def destroy
		@user.destroy
		session[:user_username] = nil if current_user == @user
		flash[:notice] = "Účet byl smazán."
		redirect_to root_path
	end

	
	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

	def set_user
		@user = User.find(params[:id])
	end

	def set_session
		session[:user_username] = Base64.encode64(@user.username)
	end

	def require_same_user
		if current_user != @user && !current_user.admin?
			flash[:alert] = "Můžeš editovat pouze svůj účet."
			redirect_to current_user
		end
	end

end