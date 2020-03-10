class User < ApplicationRecord
  has_many :books
  has_many :comments, through: :books
  validates_presence_of :username, :password
  validates_uniqueness_of :username, :email
  has_secure_password
end
