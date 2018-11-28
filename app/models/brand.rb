class Brand < ApplicationRecord
  has_many :products

  validates :name, presence: true
  validates :transparency_answers, presence: true
  validates :labor_answers, presence: true

  default_scope -> { order(name: :asc) }
end
