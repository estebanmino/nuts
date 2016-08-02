class AddPackageToOrderItems < ActiveRecord::Migration
  def change
    add_reference :order_items, :package, index: true, foreign_key: true

  end
end
