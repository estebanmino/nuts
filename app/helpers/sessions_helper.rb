module SessionsHelper

  def log_in(address)
    session[:user_id] = address.user.id
    session[:address_id] = address.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_address
    @current_address ||= Address.find_by(id: session[:address_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    session.delete(:order_id)
    @current_user = nil
  end

end
