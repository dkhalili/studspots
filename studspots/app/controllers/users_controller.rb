class UsersController < ApplicationController

before_action :authenticate, except: [:new, :create]

	def index
	end


	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
		 session[:user_id] = @user.id
		 redirect_to spots_path
		else
		 flash[:error] = "There was error creating your profile"
		 render template: "welcome/index"
		end
	end


	private
	def user_params
		params.require(:user).permit(:user_name, :name, :age.to_s, :password, :password_confirmation, )
	end

end