module SessionsHelper

	def logged_in?
		!current_user.nil?
	end

	def current_user
		@current_user ||= Admin.find_by(id: admin_id) if (admin_id = session[:admin_id])
	end
end
