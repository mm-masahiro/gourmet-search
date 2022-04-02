class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :tel, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum:5 }

  has_secure_password
end
