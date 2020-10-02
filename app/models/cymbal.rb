class Cymbal < ApplicationRecord
    has_many :favorites
    has_many :users, through: :favorites
    
    validates :brand, presence: true
    validates :line, presence: true
    validates :cym_model, presence: true
    validates :cym_type, presence: true
    validates :diameter, presence: true

    scope :sorted, -> { order(diameter: :asc) }

end