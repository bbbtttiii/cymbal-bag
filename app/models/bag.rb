class Bag < ApplicationRecord
    belongs_to :user
    belongs_to :cymbal

    # scope :most_cymbals, -> { order('cymbals_count desc') }
end
