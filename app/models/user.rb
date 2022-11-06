class User < ApplicationRecord
  has_many :tasks
  has_secure_password
  validates :name, presence: true
  EMAIL_REGEX = /\A[0-9a-z]+@[0-9a-z]+\.[0-9a-z]+\z/
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: true, presence: true
  validates :password, length: { minimum: 6}, format: { with: /\A[0-9a-z]+\z/}
end
