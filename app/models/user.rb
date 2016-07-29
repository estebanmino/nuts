class User < ActiveRecord::Base

  validates :password, presence: {message: "Contraseña debe estar presente"}, length: { minimum: 6, message: "Contraseña debe tener al menos 6 caracteres" }
  validates :password_confirmation, presence: {message: "Contraseña debe estar presente"}, length: { minimum: 6, message: "Contraseña debe tener al menos 6 caracteres" }
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: { message: "Email de contacto debe estar presente" }, format: { with: VALID_EMAIL_REGEX, message: "Formato de email invalido" }, uniqueness: { case_sensitive: false, message: "Ya existe una cuenta de usuario con este mail" }


  belongs_to :address


end
