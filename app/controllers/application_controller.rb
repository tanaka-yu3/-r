class ApplicationController < ActionController::Base

	def index
		@user=User.all
		
	end

	def show
		@user=User.find(params[:id])
	end

	def new
		@User=User.new
	end

	def create
		user=User.new(user_params)
		user.save
		redirect_to book_index_path
	end

	def edit
		@user=User.find(params[:id])
	end

	def update
		user=User.find(params[:id])
		user.update
	end

	private
	def user_params
		params.require(:user).premit(:name, :profile_image_id, :introduction)
	end
end
