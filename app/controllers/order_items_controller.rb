class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
    flash[:success] = 'Producto agregado al carrito de compras'
    redirect_to products_path
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    current_order.save
    flash[:success] = 'Producto modificado correctamente'
    redirect_to products_path

  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    
    redirect_to confirm_path
    flash[:success] = 'Producto eliminado correctamente'

  end

private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

end
