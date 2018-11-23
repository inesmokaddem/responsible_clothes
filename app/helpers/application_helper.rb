module ApplicationHelper
  def ecological_rating
    water_footprint + carbon_footprint / 2
  end

  def water_footprint(footprint)
    if footprint > 50000
      1
    elsif footprint > 40000
      2
    end
  end

  def global_rating(ecological_rating, social_rating)
    ecological_rating + social_rating / 2
  end
end
