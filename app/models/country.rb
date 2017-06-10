class Country < ApplicationRecord
  validates :name, :iso2_code, :iso3_code, presence: true, uniqueness: true
  validates :currency, presence: true
end
