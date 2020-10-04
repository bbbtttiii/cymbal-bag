class Cymbal < ApplicationRecord
    has_many :favorites
    has_many :users, through: :favorites
    accepts_nested_attributes_for :favorites
    
    validates :brand, presence: true
    validates :line, presence: true
    validates :cym_type, presence: true
    validates :diameter, presence: true

    scope :size_sorted, -> { order(diameter: :asc) }
    scope :date_sorted, -> { order(created_at: :desc) }

end