class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :before_edit ,only: [:edit]

	def index
		@book=Book.new
		@users=User.all
	end

	def show
		@book=Book.new
		@user=User.find(params[:id])
		@books=User.find(params[:id]).books
	end

	def new
		@book=Book.new
	end

	def before_edit
		@user=User.find(params[:id])
		if @user.id != current_user.id
			redirect_to user_path(current_user.id)
		end
	end

	def edit
		@user=User.find(params[:id])
	end


	def update
		@user=User.find(params[:id])
		if @user.update(user_params)
		flash[:update]="You have updated user successfully."
		redirect_to user_path(current_user.id)
		else
		render "users/edit"
	end
	end

	private

	def user_params
		params.require(:user).permit(:name,:profile_image,:introduction)
	end
end
