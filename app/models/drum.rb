class Drum < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    # validates :brand, presence: true
    # validates :line, presence: true
    # validates :cym_model, presence: true
    # validates :cym_type, presence: true
    # validates :diameter, presence: true
end