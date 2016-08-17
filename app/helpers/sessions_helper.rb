module SessionsHelper

	def logged_in?
		!current_user.nil?
	end

	def current_user
		if admin_id = session[:admin_id]
			@current_user ||= Admin.find_by(id: admin_id) 
		end
	end

	def logout
		session.delete(:admin_id)
		@current_user = nil
	end	
	
end
