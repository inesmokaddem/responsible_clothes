class Product < ApplicationRecord
  belongs_to :brand
  has_many :favorites

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :water_footprint, presence: true
  validates :carbon_footprint, presence: true

  def water_score
    case water_footprint
    when 1..2000
      :success
    when 2001..20000
      :info
    when 20001..99999999999
      :danger
    end
  end
end
