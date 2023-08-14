class GenresController < ApplicationController
	before_action :set_genre, only:[:show, :update, :edit, :destroy]
	before_action :check_session

	def show
	end

	def index
			@genres = Genre.all
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
			@genre = Genre.find(params[:id])
	end

	def genre_params
		params.require(:genre).permit(:name, :description)
	end
end