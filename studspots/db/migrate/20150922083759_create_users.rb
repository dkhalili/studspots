class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :user_name
    	t.string :name
    	t.integer :age
    	t.string :password_digest
    	t.integer :favorites, array:true, default: []
    end
  end
end
