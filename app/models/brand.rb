class Brand < ApplicationRecord
  has_many :products

  validates :name, presence: true
  validates :transparency_answers, presence: true
  validates :labor_answers, presence: true

  default_scope -> { order(name: :asc) }

  def transparency_score
    transparency_answers * 3 / 9.0
  end

  def transparency_color
    case transparency_score
    when 0..1.5
      :danger
    when 1.6..2.5
      :info
    when 2.6..3
      :success
    end
  end

  def labor_score
    labor_answers * 3 / 12.0
  end

  def labor_color
    case labor_score
    when 0..1.5
      :danger
    when 1.6..2.5
      :info
    when 2.6..3
      :success
    end
  end

  def brand_score
    labor_score + transparency_score
  end
end
