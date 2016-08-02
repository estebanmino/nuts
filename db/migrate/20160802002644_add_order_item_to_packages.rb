class AddOrderItemToPackages < ActiveRecord::Migration
  def change
    add_reference :packages, :order_item, index: true, foreign_key: true
  end
end
