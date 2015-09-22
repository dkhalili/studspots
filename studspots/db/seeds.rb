# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
long = -73.9895650.to_s
lat = 40.7398530.to_s
response = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="+lat+","+long+"&radius=500&types=cafe&key=")
results = response["results"]

results.each do |result|
	Spot.create(:name => result["name"], :address => result["vicinity"], :store_hours => result["opening_hours"]["open_now"],:longitude => result["geometry"]["location"]["lng"], :latitude => result["geometry"]["location"]["lat"], :wifi => "_", :quiet => "_", :outlets => "_", :outdoor_indoor => "_", :likes => 0, :dislikes => 0)
end