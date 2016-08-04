class SessionsController < ApplicationController

  def new
  end

  def checkout_login
    address = Address.find_by(email: params[:session][:email].downcase)

    if !address.nil? && !address.user.nil? && address.user.authenticate(params[:session][:password])
      log_in address
      current_order.update_attribute(:address_id, address.id)
      redirect_to confirmation_path
    else
      flash[:danger] = 'Email o contraseña incorrectos'
      redirect_to checkout_path
    end


  end

  def create
    address = Address.find_by(email: params[:session][:email].downcase)

    if address && !address.user.nil? && address.user.authenticate(params[:session][:password])
      log_in address
      redirect_to home_path
      flash[:success] = 'Bienvenid@!'
    else
      flash[:danger] = 'Email o contraseña incorrectos'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to home_path
  end

end
