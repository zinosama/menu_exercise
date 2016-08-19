class SessionsController < ApplicationController

  def new
  end

  def create
    admin = Admin.find_by(username: params[:session][:username])
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      redirect_and_flash(root_path, :success, "Welcome back, #{admin.username}!")
    else
      flash.now[:error] = "Invalid username/password combination"
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_and_flash(root_path, :success, "Bye")
  end
  
end
