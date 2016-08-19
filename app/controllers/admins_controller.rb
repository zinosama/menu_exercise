class AdminsController < ApplicationController
  
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_create_params)
    if @admin.save
      log_in @admin
      redirect_and_flash(root_path, :success, "Success. Thank you for registering with us!")
    else
      render('new')
    end
  end

  private

  def admin_create_params
    params.require(:admin).permit(:username, :password, :password_confirmation)
  end

end
