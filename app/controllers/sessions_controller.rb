class SessionsController < ApplicationController

  def new
  end

  def create
    admin = Admin.find_by(username: params[:session][:username])
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      redirect_to root_path, flash: { success: "Welcome back, #{admin.username}!" }
    else
      flash.now[:error] = "Invalid username/password combination"
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_path, flash: { success: "Bye" }
  end
  
end
