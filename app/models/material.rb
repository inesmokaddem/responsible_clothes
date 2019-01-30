class Material < ApplicationRecord
  has_many :products
  has_many :compositions

  default_scope -> { order(name: :asc) }
end
