class Material < ApplicationRecord
  has_many :products, through: :compositions
  has_many :compositions

  default_scope -> { order(name: :asc) }
end
