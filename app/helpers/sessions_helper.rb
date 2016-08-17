module SessionsHelper

	def logged_in?
		!current_user.nil?
	end

	def current_user
		
	end
end
