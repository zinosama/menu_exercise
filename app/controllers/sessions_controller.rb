class SessionsController < ApplicationController

	def new
	end

	def create
		admin = Admin.find_by(username: params[:session][:username])
		if admin & admin.authenticate(params[:session][:password])
			session[:admin_id] = admin.id
		else
			flash.now[:error] = "Invalid username/password combination"
			render 'new'
		end
	end
	
end
