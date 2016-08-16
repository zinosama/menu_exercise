class Admin < ActiveRecord::Base
	has_secure_password

	validates :username, presence: true	
	validates :password, presence: true, allow_nil: true
end
