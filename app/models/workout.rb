class Workout < ApplicationRecord
    belongs_to :user
    belongs_to :cymbal, required: false
    validates :name, presence: true

    # scope :most_cymbals, -> { order('cymbals_count desc') }
end