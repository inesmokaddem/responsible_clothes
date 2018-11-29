class Product < ApplicationRecord
  before_validation :water_footprint_calculation
  before_validation :carbon_footprint_calculation

  after_validation :global_rating_calculation

  mount_uploader :photo, PhotoUploader

  monetize :price_cents

  default_scope -> { order(name: :asc) }

  enum gender: [:women, :men, :child]
  belongs_to :brand
  has_many :favorites
  belongs_to :gender
  belongs_to :category
  belongs_to :material
  belongs_to :country


  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :gender, presence: true
  validates :category, presence: true
  validates :water_footprint, presence: true
  validates :carbon_footprint, presence: true
  validates :country, presence: true
  validates :price_cents, presence: true

  def water_color
    case water_footprint
    when 1..2000
      :success
    when 2001..5000
      :info
    when 5001..99999999999
      :danger
    end
  end

  def water_score
    case water_footprint
    when 1..2000
      3
    when 2001..4000
      2
    when 4001..6000
      1
    when 6001..99999999999
      0
    end
  end

  def carbon_color
    case carbon_footprint
    when 1..3000
      :success
    when 3001..7000
      :info
    when 7001..99999999999
      :danger
    end
  end

  def carbon_score
    case carbon_footprint
    when 1..2000
      3
    when 2001..4000
      2
    when 4001..7000
      1
    when 7001..99999999999
      0
    end
  end

  def global_color
    case global_rating
    when 1..4
      :danger
    when 4..7
      :info
    when 7..10
      :success
    end
  end

  def product_score
    ((carbon_score + water_score + brand.brand_score) * 10.0) / 12.0
  end

  def water_footprint_calculation
    wfp_value = category.weight * material.water_foot_print_per_kilo
    self.water_footprint = wfp_value
  end

  def carbon_footprint_calculation
    cfp_value = country.distance
    self.carbon_footprint = cfp_value
  end

  def global_rating_calculation
    self.global_rating = product_score.round(1)
  end
end
