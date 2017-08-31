class User < ApplicationRecord
	#validations
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true
	validates :profile_id, presence: true

	has_secure_password
	has_secure_token
	 
	 # This method is not available in has_secure_token
	 def invalidate_token
	   self.update_columns(token: nil)
	 end
	 
	 def self.valid_login?(email, password)
	   user = find_by(email: email)
	   if user && user.authenticate(password)
	    user
	   end
	 end
end
