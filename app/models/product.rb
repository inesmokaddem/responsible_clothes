class Product < ApplicationRecord
  enum gender: [:women, :men, :child]
  belongs_to :brand
  has_many :favorites
  belongs_to :gender
  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true
  validates :gender, presence: true
  validates :category, presence: true
  validates :water_footprint, presence: true
  validates :carbon_footprint, presence: true
end
