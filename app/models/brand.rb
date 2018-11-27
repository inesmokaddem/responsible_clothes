class Brand < ApplicationRecord
  has_many :products

  validates :name, presence: true
  validates :description, presence: true
  validates :country, presence: true
  validates :rating, presence: true

  default_scope -> { order(name: :asc) }
end
