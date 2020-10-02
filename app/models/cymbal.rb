class Cymbal < ApplicationRecord
    has_many :bags
    has_many :users, through: :bags

    # validates :brand, presence: true
    # validates :line, presence: true
    # validates :cym_model, presence: true
    # validates :cym_type, presence: true
    # validates :diameter, presence: true
end