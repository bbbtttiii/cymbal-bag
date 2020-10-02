class Review < ApplicationRecord
    belongs_to :user
    belongs_to :drum, required: false
    validates :name, presence: true

    # scope :most_cymbals, -> { order('cymbals_count desc') }
end