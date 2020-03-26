class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :before_book ,only: [:edit]

	def index
		@books=Book.all
		@book=Book.new
		@user=current_user
	end

	def new
		@book=Book.new
	end

	def show
		@book=Book.find(params[:id])
		@new_book = Book.new
		@user=Book.find(params[:id]).user
	end

	def before_book
		@book=Book.find(params[:id])
		if @book.user_id != current_user.id
			redirect_to books_path
		end
	end

	def edit
		@book=Book.find(params[:id])
	end

	def create
		@book=Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
       	flash[:create]="You have creatad book successfully."
		redirect_to book_path(@book.id)
       	else
       		@books=Book.all
       		render "books/index"
	end
	end

	def update
		@book=Book.find(params[:id])
		if @book.update(book_params)
			flash[:update]="You have updated book successfully."
		redirect_to book_path(@book.id)
	    else
	    	render "books/edit"
	end
	end

	def destroy
		@book=Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title ,:body)
	end
end
