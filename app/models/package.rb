class Package < ActiveRecord::Base

  validates :weight,  presence: { message: "Nombre debe estar presente" }
  validates :unit_price,  presence: { message: "Apellido debe estar presente" }
  validates :price,  presence: { message: "Calle domicilio debe estar presente" }

  belongs_to :product
  has_many :order_items

end
