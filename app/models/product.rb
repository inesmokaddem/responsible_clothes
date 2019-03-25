class Product < ApplicationRecord
  before_validation :remove_empty_composition
  before_validation :carbon_footprint_calculation
  before_validation :water_footprint_calculation

  after_validation :global_rating_calculation

  mount_uploader :photo, PhotoUploader

  monetize :price_cents

  default_scope -> { order(name: :asc) }

  enum gender: [:women, :men, :child]
  belongs_to :brand
  has_many :favorites
  belongs_to :gender
  belongs_to :category
  belongs_to :country
  has_many :reviews, dependent: :destroy
  has_many :compositions, dependent: :destroy
  has_many :materials, through: :compositions

  accepts_nested_attributes_for :compositions, allow_destroy: true
  # , reject_if: proc { |att| att['material'].blank? || att['percentage'].blank? }



  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :gender, presence: true
  validates :category, presence: true
  validates :water_footprint, presence: true
  validates :carbon_footprint, presence: true
  validates :country, presence: true
  validates :price_cents, presence: true
  validate :composition_cannot_be_lower_than_100


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
    when 4.1..7
      :info
    when 7.1..10
      :success
    end
  end



  def composition_cannot_be_lower_than_100
    unless self.compositions.any? { |composition| composition.percentage.nil? }
      percentages = self.compositions.map(&:percentage)
      if percentages.inject(0, :+) != 100
        errors.add(:compositions, "the total of the composition must be 100%")
      end
    end
  end
  # def composition_cannot_be_lower_than_100
  #   percentage_array = []
  #   self.compositions.each do |composition|
  #     percentage_array << composition.percentage
  #   end
  #   if percentage_array.reduce(&:+) != 100
  #    errors.add(:compositions, "the total of the composition must be 100%")
  #   end
  # end


  def product_score
    ((carbon_score + water_score.to_i + brand.brand_score) * 10.0) / 12.0
  end

  # def water_footprint_calculation
  #   wfp_value = category.weight * material.water_foot_print_per_kilo
  #   self.water_footprint = wfp_value
  # end

  def remove_empty_composition
    compositions.select { |composition| composition.percentage.nil? || composition.material.nil? }.each { |composition| composition.delete  }
  end

  # test calcul water footprint
  def water_footprint_calculation
    unless self.compositions.any? { |composition| composition.percentage.nil? } || category.nil?
      self.water_footprint = self.compositions.inject(0) do |total, c|
        total + c.percentage.to_f / 100 * category.weight * c.material.water_foot_print_per_kilo
      end
    end
  end
  # end test


  def carbon_footprint_calculation
    unless country.nil?
      cfp_value = country.distance
      self.carbon_footprint = cfp_value
    end
  end

  def global_rating_calculation
    self.global_rating = product_score.round(1)
  end

  def average_stars
    return 0 if self.reviews.size == 0

    stars = self.reviews.map(&:stars)
   (stars.inject { |sum, el| sum + el }.to_f / stars.size).round
  end
end
