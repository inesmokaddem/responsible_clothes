class Brand < ApplicationRecord
  has_many :products

  validates :name, presence: true
  validates :transparency_score, presence: true
  validates :labor_score, presence: true

  default_scope -> { order(name: :asc) }
end
