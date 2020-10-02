class Client < ApplicationRecord
    has_many :workouts
    has_many :users, through: :workouts

    validates :brand, presence: true
    validates :line, presence: true
    validates :cym_model, presence: true
    validates :cym_type, presence: true
    validates :diameter, presence: true
end