class User < ApplicationRecord

  has_secure_password
  
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }, confirmation: true
  validates :password_confirmation, presence: true

end
