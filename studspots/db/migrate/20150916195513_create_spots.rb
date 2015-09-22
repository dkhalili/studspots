class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
    	t.string :name
    	t.string :address
    	t.string :store_hours
    	t.string :longitude
    	t.string :latitude
    	t.string :wifi
    	t.string :quiet
    	t.string :outlets
    	t.string :outdoor_indoor
    	t.integer :likes
    	t.integer :dislikes
    end
  end
end
