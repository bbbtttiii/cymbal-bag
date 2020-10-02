class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }

    has_many :bags
    has_many :cymbals, through: :bags

    # def self.from_omniauth(auth)
    #     # Creates a new user only if it doesn't exist
    #     where(email: auth.info.email).first_or_initialize do |user|
    #       user.name = auth.info.name
    #       user.email = auth.info.email
    #     end
    # end

end