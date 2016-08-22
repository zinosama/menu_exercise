module SessionsHelper

  def logged_in?
    !current_admin.nil?
  end

  def log_in(user)
    session[:admin_id] = user.id
  end

  def current_admin
    if admin_id = session[:admin_id]
      @current_admin ||= Admin.find_by(id: admin_id) 
    end
  end

  def current_user
    @current_user ||= User.find_session(session)
  end

  def logout
    session.delete(:admin_id)
    @current_admin = nil
  end 
  
end
