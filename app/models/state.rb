class State < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :country_id, presence: true

  belongs_to :country
  has_many :cities
end
