Favorite.destroy_all
puts "Destroyed all Favorites"

Product.destroy_all
puts "Destroyed all Products"

User.destroy_all
puts "Destroyed all users"

Brand.destroy_all
puts "Destroyed all Brands"


user = User.create!(email: "toto@toto.com", password: "secret")
puts "created 1 user email: toto@toto.com password: secret"

north_face = Brand.create(name: "North Face", description: "The North Face, Inc. is an American outdoor product company specializing in outerwear, coats, shirts, footwear, and equipment such as backpacks, tents, and sleeping bags.", country: "USA", rating:2)
puts 'created 1 brand'

tee = Product.create(name: "tee-shirt", description: "coton bio", gender: 1, category: "top", water_footprint: (1..10).to_a.sample, carbon_footprint: (1..10).to_a.sample, brand: north_face)
puts 'created 1 product'

favorite = Favorite.create(user_id: 1, product_id: 1)
puts 'created 1 favorite'


zara = Brand.create(
            name: "Zara",
            description: "Zara is a Spanish fast fashion (clothing and accessories) retailer based in Arteixo (A Coruña) in Galicia.",
            country: "Spain",
            rating:7)
h_and_m = Brand.create(
            name: "H&M",
            description: "Hennes & Mauritz AB is a Swedish multinational clothing-retail company known for its fast-fashion clothing for men, women, teenagers and children.",
            country: "Sweden",
            rating:9)
mango = Brand.create(
            name: "Mango",
            description: "MANGO, is a Spanish clothing design and manufacturing company, founded in Barcelona, Catalonia.",
            country: "Spain",
            rating:5)
uniqlo = Brand.create(
            name: "Uniqlo",
            description: "Uniqlo is a Japanese casual wear designer, manufacturer and retailer.",
            country: "Japan",
            rating:8)
diesel = Brand.create(
            name: "Diesel",
            description: "Diesel is an Italian retail clothing company, located in Breganze, Italy. It sells denim, and other clothing, footwear, and accessories.",
            country: "Italia",
            rating:2)

puts "created 5 more brands"
