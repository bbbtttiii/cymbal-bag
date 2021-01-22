class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :cymbal, required: false
  validates :name, presence: true
end