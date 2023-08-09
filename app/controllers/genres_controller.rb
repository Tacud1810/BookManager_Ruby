class GenresController < ApplicationController
	before_action :set_genre, only:[:show, :update, :edit, :destroy]

	def show
	end

	def index
		if session[:user_username]
			@genres = Genre.all
		else	
			redirect_to root_path
		end	
	end

	def new
		@genre = Genre.new
	end

	def update
		if @genre.update(genre_params)
			flash[:notice] = "Update succesfull"
			redirect_to genres_path
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def edit
	end

	def create
		@genre = Genre.new(genre_params)
		# @genre.user = User.first
		if @genre.save
			flash[:notice] = "Genre was created succesfully."
			redirect_to @genre
		else
			render :new, status: :unprocessable_entity
		end
	end

	def destroy
		@genre.destroy
		redirect_to genres_path
	end

	private
	def set_genre
		if session[:user_username]
			@genre = Genre.find(params[:id])
		else 
			redirect_to root_path
		end	
	end

	def genre_params
		params.require(:genre).permit(:name, :description)
	end
end