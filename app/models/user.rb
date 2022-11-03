class User < ApplicationRecord
  validates :name, presence: true
  REGEX = /\A[0-9a-z]+@[0-9a-z]+\.[0-9a-z]+\z/
  validates :email, format: { with: REGEX }, uniqueness: true, presence: true
end
