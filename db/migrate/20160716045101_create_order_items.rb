class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :unit_price
      t.integer :quantity
      t.integer :total_price

      t.timestamps null: false
    end
  end
end
