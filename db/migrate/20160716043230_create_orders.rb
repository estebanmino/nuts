class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :subtotal
      t.integer :shipping
      t.integer :total
      t.boolean :confirmed
      t.boolean :delivered
      t.references :address, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
