class City < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :state_id, presence: true

  belongs_to :state
end
