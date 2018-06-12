class UsersController < ApplicationController

	def new
		@users = User.all
		@user = User.new
	end

	def create
		User.create(user_params)
		redirect_to new_user_path
	end


	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :user_profile)
	end
end
