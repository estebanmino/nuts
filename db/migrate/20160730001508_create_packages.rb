class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.float   :weight
      t.integer :unit_price
      t.integer :price

      t.timestamps null: false
    end
  end
end
