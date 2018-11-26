class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  enum gender: [:women, :men, :child]
  belongs_to :brand
  has_many :favorites
  belongs_to :gender
  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :gender, presence: true
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
