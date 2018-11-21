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
    when 1..20000
      :success
    when 20001..50000
      :info
    when 50001..99999999999
      :danger
    end
  end
end
