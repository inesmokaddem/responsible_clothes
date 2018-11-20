puts "Creating 1 brand"
brand = Brand.create(name: "zara", description: "spanish brand", country: "Spain", rating:3)


puts "Creating 1 product"
Product.create(name: "tee-shirt", description: "coton bio", category: "top", water_footprint: 3, carbon_footprint: 5, brand: brand )
