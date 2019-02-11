class Composition < ApplicationRecord
  belongs_to :product, inverse_of: :compositions
  belongs_to :material


end
