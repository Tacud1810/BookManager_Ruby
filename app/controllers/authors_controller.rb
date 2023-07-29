class AuthorsController < ApplicationController
	before_action :set_author, only:[:show, :update, :edit, :destroy]

	def show
	end

	def index
		@authors = Author.all
	end
	def new
		@author = Author.new
	end

	def update
		if @author.update(author_params)
			flash[:notice] = "Update succesfull"
			redirect_to authors_path
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def edit
	end

	def create
		@author = Author.new(author_params)
		# @genre.user = User.first
		if @author.save
			flash[:notice] = "Author was created succesfully."
			redirect_to @author
		else
			render :new, status: :unprocessable_entity
		end
	end

	def destroy
		@author.destroy
		redirect_to authors_path
	end

	private
	def set_author
		@author = Author.find(params[:id])
	end

	def author_params
		params.require(:author).permit(:name, :description, :year_of_birth, :nationality)
	end

end