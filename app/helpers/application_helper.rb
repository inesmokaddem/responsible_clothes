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

  def dressing_rating(products)
    return nil unless products.any?
    grades = products.map do |product|
      product.product_score
    end
    (grades.sum / grades.count).round(1)
  end

  def dressing_rating_color(products)
    case dressing_rating(products)
    when 1..4
      :danger
    when 4.1..7
      :info
    when 7.1..10
      :success
    end
  end

  def link_to_add_row(name, f, association, **args)
   new_object = f.object.send(association).klass.new
   id = new_object.object_id
   fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
     render(association.to_s.singularize, f: builder)
   end
   link_to(name, '#', class: "add_record " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
 end
end
