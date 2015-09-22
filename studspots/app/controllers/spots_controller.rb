class SpotsController < ApplicationController
	def update
		long = -73.9895650.to_s
		lat = 40.7398530.to_s
		response = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="+lat+","+long+"&radius=500&types=cafe&key=AIzaSyAx9k85xNhwNitXhTZeV1xYLYvTp0sUzRA")
		@results = response["results"]
		spots = Spot.all
		there = false
		# @results.each do |result|
		# 	spots.each do |spot|
		# 		spot_location = {"lat"=>spot["latitude"], "lng"=>spot["longitude"]}
		# 		if result["geometry"]["location"] == spot_location
		# 			there = true
		# 		else
		# 			there = false
		# 		end
		# 	end
		# 	if there == false
		# 		puts "add"
		# 		new_spot = Spot.new
		# 		new_spot = Spot.create(:name => result["name"], :address => result["vicinity"], :store_hours => result["opening_hours"]["open_now"],:longitude => result["geometry"]["location"]["lng"], :latitude => result["geometry"]["location"]["lat"], :wifi => "_", :quiet => "_", :outlets => "_", :outdoor_indoor => "_", :likes => 0, :dislikes => 0)
		# 	end
		# end
		
	end

	def index
		@spots = Spot.all
		@long = -73.9895650
		@lat = 40.7398530
		@update = update
	end


	def new
		@spot = Spot.new
	end

	def create
		@spot = Spot.create(spot_params)
		redirect_to spots_path
	end

	def show
		spot_id = params[:id]
		@long = -73.9895650
		@lat = 40.7398530
		@spot = Spot.find_by(id: spot_id)
		@user = User.find_by(session[:id])
	end


	private
	def spot_params
		params.require(:spot).permit(:name, :address, :store_hours, :longitude, :latitude, :wifi, :quiet, :outlets, :outdoor_indoor, :likes, :dislikes)
	end
end