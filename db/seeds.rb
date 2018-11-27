# Favorite.destroy_all
User.destroy_all
Product.destroy_all
Brand.destroy_all
Gender.destroy_all
Category.destroy_all

puts "Creating tot user"
toto = User.new(email: "toto@toto.com", password: "secret")

categories_data = [
  { name: 'Dress', weight: 0.35 },
  { name: 'T-shirt', weight: 0.3 },
  { name: 'Blouse', weight: 0.3 },
  { name: 'Blazer', weight: 0.5 },
  { name: 'Sweatshirt', weight: 0.4 },
  { name: 'Sweater', weight: 0.4 },
  { name: 'Jacket', weight: 0.8 },
  { name: 'Trouser', weight: 0.5 },
  { name: 'Jeans', weight: 0.7 },
  { name: 'Jumpsuit', weight: 0.6 },
  { name: 'Skirt', weight: 0.3 },
  { name: 'Short', weight: 0.3 },
  { name: 'Swimwear', weight: 0.2 },
  { name: 'Coat', weight: 1.2 },
  { name: 'Shirt', weight: 0.25 },
  { name: 'Underwear', weight: 0.1 },
  { name: 'Gloves', weight: 0.1 },
  { name: 'Legging', weight: 0.3 }
]

categories = {}

categories_data.each do |category_data|
  categories[category_data[:name]] = Category.create!(category_data)
end

materials_data = [
  { name: 'Cotton', water_foot_print_per_kilo: 10000 },
  { name: 'Linen', water_foot_print_per_kilo: 450 },
  { name: 'Polyester', water_foot_print_per_kilo: 900 },
  { name: 'Viscose', water_foot_print_per_kilo: 3300 },
  { name: 'Wool', water_foot_print_per_kilo: 50 },
  { name: 'Leather', water_foot_print_per_kilo: 13000 },
  { name: 'Nylon', water_foot_print_per_kilo: 3550 },
  { name: 'Acrylic', water_foot_print_per_kilo: 1100 },
]

categories = {}

categories_data.each do |category_data|
  categories[category_data[:name]] = Category.create!(category_data)
end


men = Gender.create!(name: "Men")
women = Gender.create!(name: "Women")
kids = Gender.create!(name: "Kids")

puts "Creating brands"

north_face = Brand.create(
            name: "North Face",
            description: "The North Face, Inc. is an American outdoor product company specializing in outerwear, coats, shirts, footwear, and equipment such as backpacks, tents, and sleeping bags.",
            country: "USA",
            rating:2)
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

puts "Creating products"
product =  Product.new(
                      name: "T-SHIRT",
                      description: "T-shirt basique coupe regular avec col rond et manches courtes - 5,95€",
                      water_footprint: 3,
                      carbon_footprint: 5,
                      brand: zara,
                      gender: men,
                      category: categories['T-shirt']
                      )

# Product.new( name: "T-SHIRT", description: "T-shirt basique coupe regular avec col rond et manches courtes - 5,95€",water_footprint: 3,carbon_footprint: 5,brand: zara,gender: men,category: categories['T-shirt'])
url = "https://res.cloudinary.com/be-better-hotels/image/upload/v1542974404/tshirthomme-zara.jpg"
product.remote_photo_url = url
product.save
# https://www.zara.com/fr/fr/t-shirt-basique-coupe-regular-p09240330.html?v1=8188049&v2=1079339

product2 =  Product.new(
                      name: "Sweater",
                      description: "Sweat à capuche kaws x Sesame Street femme - 24,90€",
                      water_footprint: 3,
                      carbon_footprint: 5,
                      brand: zara,
                      gender: women,
                      category: categories['Sweater']
                      )
url = "https://res.cloudinary.com/be-better-hotels/image/upload/v1542974404/sweater-femme-uniqlo.jpg"
product2.remote_photo_url = url
product2.save
# https://www.uniqlo.com/fr/fr/product/sweat-a-capuche-kaws-x-sesame-street-femme-416097.html?dwvar_416097_size=SMA002&dwvar_416097_color=COL69&cgid=IDhooded-sweatshirts1243

product3 =  Product.new(
                      name: "Pantalon",
                      description: "Pantalon flare velours côtelé - 59,99€",
                      water_footprint: 3,
                      carbon_footprint: 5,
                      brand: zara,
                      gender: men,
                      category: categories['Trouser']
                      )
url = "https://res.cloudinary.com/be-better-hotels/image/upload/v1542974404/pantalon-velour-femme-Mango.jpg"
product3.remote_photo_url = url
product3.save
# https://shop.mango.com/fr/femme/pantalons/pantalon-flare-velours-cotele_31088805.html?c=09&n=1&s=prendas_she.familia;26,326,22,322
puts "Created 3 products"
