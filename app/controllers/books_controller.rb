class BooksController < ApplicationController
	
	def index
		@books=Book.all
		
	end

	def show
		@book=Book.find(params[:id])
	end

	def new
		@book=Book.new
	end

	def create
		book=Book.new(book_params)
		book.save
		redirecto_to book_path(book.id)
	end

	def edit
		@book=book.find(params[:id])
	end

	def update
		book=Book.find(params[:id])
		book.update(book_params)
		redirecto_to book_path(@book)
	end

	def destroy
		book=book.find(params[:id])
		book.destroy
		redirecto_to book_index_path
	end

	private
	def book_params
		params.require(:book).premit(:title, :body)
	end
end