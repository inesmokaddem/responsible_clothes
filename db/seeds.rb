Favorite.destroy_all
User.destroy_all
Product.destroy_all
Brand.destroy_all
Gender.destroy_all
Category.destroy_all

categories_data = [
  { name: 'Dress' },
  { name: 'T-shirt' },
  { name: 'Shirt/Blouse' },
  { name: 'Blazer' },
  { name: 'Sweatshirt' },
  { name: 'Sweater' },
  { name: 'Jacket' },
  { name: 'Trouser' },
  { name: 'Jumpsuit' },
  { name: 'Skirt' },
  { name: 'Shoes' },
  { name: 'Short' },
  { name: 'Swimwear' },
  { name: 'Lingerie' },
  { name: 'Socks' },
  { name: 'Pijama' },
  { name: 'Coat' },
  { name: 'Gloves' },
  { name: 'Shirt' },
  { name: 'Underwear' },
  { name: 'Body' },
  { name: 'Legging' }
]

categories = {}

categories_data.each do |category_data|
  categories[category_data[:name]] = Category.create!(category_data)
end


men = Gender.create!(name: "Men")
women = Gender.create!(name: "Women")
kids = Gender.create!(name: "Kids")

puts "Creating 1 brand"
zara = Brand.create(name: "zara", description: "spanish brand", country: "Spain", rating:3)
north_face = Brand.create(name: "North Face", description: "The North Face, Inc. is an American outdoor product company specializing in outerwear, coats, shirts, footwear, and equipment such as backpacks, tents, and sleeping bags.", country: "USA", rating:2)
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

puts "Creating 1 product"
product =  Product.new(
                      name: "tee-shirt",
                      description: "coton bio",
                      water_footprint: 3,
                      carbon_footprint: 5,
                      brand: zara,
                      gender: men,
                      category: categories['T-shirt']
                      )
url = "https://cdn.shopify.com/s/files/1/2277/0027/products/3256206_191bb8162e_800x.jpg?v=1539401500"
product.remote_photo_url = url
product.save
