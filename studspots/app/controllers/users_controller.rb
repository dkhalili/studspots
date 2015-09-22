class UsersController < ApplicationController


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

	def show
		@user = User.find(session[:user_id])
		@long = -73.9895650
		@lat = 40.7398530
		@favorites = @user["favorites"]
	end


	private
	def user_params
		params.require(:user).permit(:user_name, :name, :age.to_s, :password, :password_confirmation, )
	end

end