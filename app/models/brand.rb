class Brand < ApplicationRecord
  has_many :products

  validates :name, presence: true
  # validates :description, presence: true
  # validates :country, presence: true
  # validates :rating, presence: true

  default_scope -> { order(name: :asc) }

  def transparency_score
    transparency_answers * 3 / 9.0
  end

  def labor_score
    labor_answers * 3 / 12.0
  end
end
