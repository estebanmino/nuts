class AddProductToOrderItems < ActiveRecord::Migration
  def change
    add_reference :order_items, :product, index: true, foreign_key: true
  end
end
