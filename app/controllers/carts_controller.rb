class CartsController < ApplicationController

  def show
    @order_items = current_order.order_items
  end

  def checkout
  end

  def confirmation
    @order_items = current_order.order_items
  end

  def address
    @address = Address.new
  end

  def confirm
    current_order.update_attribute(:confirmed, true)
    if !logged_in?
      session.delete(:address_id)
    else
      current_order.update_attribute(:address_id, current_user.id)
    end
    session.delete(:order_id)
    redirect_to home_path
    flash[:success] = 'Pedido confirmado, por favor revise su email'
  end

  def checkout_address
    @address = Address.create(address_params)
    session[:address_id] = @address.id
    current_order.update_attribute(:address_id, @address.id)
    redirect_to confirmation_path
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_address
    @address = Address.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def address_params
    params.require(:address).permit(:first_name, :last_name, :street, :number, :commune, :phone_number, :email)
  end

end
