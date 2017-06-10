class Profile < ApplicationRecord
  validates :name, :date_of_birth, :gender, :city_id, presence: true

  belongs_to :city
end
