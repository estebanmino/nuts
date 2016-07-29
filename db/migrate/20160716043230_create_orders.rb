class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :subtotal
      t.integer :shipping
      t.integer :total
      t.boolean :confirmed
      t.boolean :delivered

      t.timestamps null: false
    end
  end
end
