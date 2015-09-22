class WelcomeController < ApplicationController
	def index
		if session[:user_id] != nil
			redirect_to "/spots"
		end
	end
end