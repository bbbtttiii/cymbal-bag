class Bag < ApplicationRecord
    belongs_to :user
    belongs_to :cymbal, required: false

    # scope :most_cymbals, -> { order('cymbals_count desc') }
end
