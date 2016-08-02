class AddProductToPackages < ActiveRecord::Migration
  def change
    add_reference :packages, :product, index: true, foreign_key: true
  end
end
