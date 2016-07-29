module AdminSessionsHelper

  def admin_log_in(address)
    session[:address_id] = address.id
  end

  def current_user
    @current_user ||= Address.find_by(id: session[:address_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:address_id)
    session.delete(:order_id)
    @current_user = nil
  end

end
