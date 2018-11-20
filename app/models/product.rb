class Product < ApplicationRecord
  belongs_to :brand
  has_many :favorites

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :water_footprint, presence: true
  validates :carbon_footprint, presence: true
end
