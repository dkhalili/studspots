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
		@fav = []
		favorites = @user["favorites"]
		favorites.each do |favorite|
			fav_spot = Spot.find_by(id: favorite)
			@fav.push(fav_spot)
		end
	end

	def edit
		@user = User.find(session[:user_id])
	end

	def update
		@user = User.find(params["id"])
		there = false
		@user["favorites"].each do |u|
				if u == params["user"]["favorites"].to_i
					there = true
				end
		end
		if there == false
			@user.update_attribute(:favorites, @user["favorites"].push(params["user"]["favorites"].to_i))
		end
		redirect_to user_path(@user)

	end


	private
	def user_params
		params.require(:user).permit(:user_name, :name, :age.to_s, :password, :password_confirmation, )
	end

end