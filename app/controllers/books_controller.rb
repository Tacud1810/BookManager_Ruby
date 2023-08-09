class BooksController < ApplicationController
	before_action :set_book, only:[:show, :update, :edit, :destroy]

	def show
	end

	def index
		if session[:user_username]
			@books = Book.all
		else	
			redirect_to root_path
		end	
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
		@book = Book.new(book_params)
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
		if session[:user_username]
			@book = Book.find(params[:id])
		else 
			redirect_to root_path
		end	
	end

	def book_params
		params.require(:book).permit(:title, :year, :pages, :description, :image, :genre_id, :author_id)
	end


end


