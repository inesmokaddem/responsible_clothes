class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :user, uniqueness: { scope: :product }
  validates :stars, inclusion: { in: [1, 2, 3, 4, 5] }
end
