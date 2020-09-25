class UsersController < ApplicationController
    has_secure_password
    has_many :bags
    has_many :cymbals, through: :bags
end
