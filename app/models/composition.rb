class Composition < ApplicationRecord
  belongs_to :product
  belongs_to :material
  validate :composition_cannot_be_lower_than_100

  def composition_cannot_be_lower_than_100
    if composition < 100
      errors.add(:composition, "the total of the composition must be 100%")
    end
  end
end
