class Order < ActiveRecord::Base
  belongs_to :address
  has_many :order_items

  after_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.package.price) : 0 }.sum
  end


private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
