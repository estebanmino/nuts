class Address < ActiveRecord::Base

  validates :first_name,  presence: { message: "Nombre debe estar presente" }
  validates :last_name,  presence: { message: "Apellido debe estar presente" }
  validates :street,  presence: { message: "Calle domicilio debe estar presente" }
  validates :number,  presence: { message: "Número domicilio debe estar presente" }
  validates :commune,  presence: { message: "Comina domicilio debe estar presente" }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: { message: "Email de contacto debe estar presente" }, format: { with: VALID_EMAIL_REGEX, message: "Formato de email invalido" }

  has_many :orders
  has_one :user

end
