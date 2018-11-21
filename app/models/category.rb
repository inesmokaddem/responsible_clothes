class Category < ApplicationRecord
  has_many :products

  default_scope -> { order(name: :asc) }
end
