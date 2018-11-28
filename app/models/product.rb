class Product < ApplicationRecord
  before_validation :water_footprint_calculation
  before_validation :carbon_footprint_calculation

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

  include PgSearch
  pg_search_scope :search,
    against: [ :name, :price ],
    associated_against: {
      brand: [ :name ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

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

  def water_footprint_calculation
    wfp_value = category.weight * material.water_foot_print_per_kilo
    self.water_footprint = wfp_value
  end

  def carbon_footprint_calculation
    cfp_value = country.distance
    self.carbon_footprint = cfp_value
  end
end
