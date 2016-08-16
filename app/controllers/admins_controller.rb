class AdminsController < ApplicationController
	
	def new
		@admin = Admin.new
	end

	def create
		@admin = Admin.new(admin_create_params)
		if @admin.save
			redirect_and_flash(items_url, :success, "Success. Thank you for registering with us!")
		else
			render 'new'
		end
	end

	private

	def admin_create_params
		params.require(:admin).permit(:username, :password, :password_confirmation)
	end

end
