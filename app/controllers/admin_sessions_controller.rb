class AdminSessionsController < ApplicationController
  before_action :set_order, only: [:order]
  before_action :set_product, only: [:product, :edit_product]

  def new
  end

  def index
  end

  def users
  end

  def orders
  end

  def order
    @order_items = @order.order_items
  end

  def products
    @products = Product.all
  end

  def new_product
    @product = Product.new
  end

  def product
  end

  def edit_product
  end



  def delivered
    @order.update_attribute(:delivered, true)
  end

  def create

    address = Address.find_by(email: params[:admin_session][:email].downcase)

    if address && address.user.authenticate(params[:admin_session][:password]) && address.user.is_admin?

        log_in address
        redirect_to admin_users_path

    else
      flash.now[:danger] = 'Email y/o contraseña incorrectos, vuelve a intentarlo.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
