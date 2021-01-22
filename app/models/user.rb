class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  has_many :favorites
  has_many :cymbals, through: :favorites
end