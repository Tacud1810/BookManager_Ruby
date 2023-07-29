class BooksController < ApplicationController
	before_action :set_book, only:[:show, :update, :edit, :destroy]

	def show
	end

	def index
		@books = Book.all
	end
	def new
		@book = Book.new
	end

	def update
		if @book.update(book_params)
			flash[:notice] = "Update succesfull"
			redirect_to books_path
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def edit
	end

	def create
		@author = @author_id
		@category = @category_id
		@book = Book.new(book_params)
		
		# @genre.user = User.first
		if @book.save
			flash[:notice] = "Genre was created succesfully."
			redirect_to @book
		else
			render :new, status: :unprocessable_entity
		end
	end

	def destroy
		@book.destroy
		redirect_to books_path
	end

	private
	def set_book
		@book = Book.find(params[:id])
	end

	def book_params
		params.require(:book).permit(:title, :author, :year, :pages, :description, :category, :image, :authors_id, :category_id)
	end


end


