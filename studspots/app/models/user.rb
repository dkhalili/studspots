class User < ActiveRecord::Base
   has_secure_password 

   validates :user_name, uniqueness: true

   validates :password_confirmation, presence: true

end