require 'open-uri'
require 'nokogiri'

Favorite.destroy_all
Product.destroy_all
Brand.destroy_all
Gender.destroy_all
Category.destroy_all
Material.destroy_all
Country.destroy_all
User.destroy_all
Review.destroy_all

puts "Creating toto user"
toto = User.new(email: "toto@toto.com", password: "secret")
toto.save

puts "Creating Categories"

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
  { name: 'Legging', weight: 0.3 },
  { name: 'Hat', weight: 0.2 },
  { name: 'Pyjama', weight: 0.5 },
  { name: 'Socks', weight: 0.1 },
]

categories = {}

categories_data.each do |category_data|
  categories[category_data[:name]] = Category.create!(category_data)
end

puts "Creating Materials"

materials_data = [
  { name: 'Cotton', water_foot_print_per_kilo: 7000 },
  { name: 'Linen', water_foot_print_per_kilo: 2050 },
  { name: 'Polyester', water_foot_print_per_kilo: 500 },
  { name: 'Viscose', water_foot_print_per_kilo: 3800 },
  { name: 'Wool', water_foot_print_per_kilo: 2250 },
  { name: 'Silk', water_foot_print_per_kilo: 35000 },
  { name: 'Polyamide', water_foot_print_per_kilo: 500 },
  { name: 'Leather', water_foot_print_per_kilo: 13000 },
  { name: 'Nylon', water_foot_print_per_kilo: 3550 },
  { name: 'Acrylic', water_foot_print_per_kilo: 200 },
]

materials = {}

materials_data.each do |material_data|
  materials[material_data[:name]] = Material.create!(material_data)
end

puts "Creating Countries"

countries_data = [
  { name: 'Bangladesh', distance: 8000 },
  { name: 'India', distance: 7400 },
  { name: 'Vietnam', distance: 10100 },
  { name: 'China', distance: 8000 },
  { name: 'Pakistan', distance: 5900 },
  { name: 'Turkey', distance: 2800 },
  { name: 'Brazil', distance: 8600 },
  { name: 'USA', distance: 7700 },
  { name: 'Korea', distance: 9300 },
  { name: 'Taiwan', distance: 10100 },
  { name: 'Indonesia', distance: 11700 },
  { name: 'Cambodia', distance: 9950 },
  { name: 'Mexico', distance: 9200 },
  { name: 'Italy', distance: 1000 },
  { name: 'Spain', distance: 800 },
  { name: 'Japan', distance: 9800 },
  { name: 'Thailand', distance: 9400 },
  { name: 'Portugal', distance: 1100 },
  { name: 'France', distance: 200 },
]

countries = {}

countries_data.each do |country_data|
  countries[country_data[:name]] = Country.create!(country_data)
end

puts "Creating Genders"

men = Gender.create!(name: "Men")
women = Gender.create!(name: "Women")
kids = Gender.create!(name: "Kids")

puts "Creating brands"

url = "http://www.notmystyle.org/ratings.html"

html_file = open(url).read
html = Nokogiri::HTML(html_file)

html.search('.ratings-panel .panel.panel-default').each do |brand|
  name = brand.search('.panel-heading a').children.text
  answers = brand.search('.answer')

  transparency_answers = answers.first(9).map do |answer|
    answer.text.downcase
  end
  labor_answers = answers[10..-1].map do |answer|
    answer.text.downcase
  end

  transparency_answers.delete('no')
  labor_answers.delete('no')

  brand = Brand.new(
    name: name,
    transparency_answers: transparency_answers.size,
    labor_answers: labor_answers.size
  ).save!
end

# north_face = Brand.create!(
#             name: "North Face")
# zara = Brand.create!(
#             name: "Zara")
# h_and_m = Brand.create!(
#             name: "H&M")
# mango = Brand.create!(
#             name: "Mango")
# uniqlo = Brand.create!(
#             name: "Uniqlo")
# diesel = Brand.create!(
#             name: "Diesel")

puts "Creating products"
product =  Product.new(
                      ean: 9780201379624,
                      name: "T-shirt basique",
                      description: "T-shirt basique coupe regular avec col rond et manches courtes",
                      water_footprint: 0,
                      brand: Brand.all[rand(0..135)],
                      gender: men,
                      category: categories['T-shirt'],
                      material: materials['Polyester'],
                      country: countries['Bangladesh'],
                      price: 6,
                      )

# Product.new( name: "T-SHIRT", description: "T-shirt basique coupe regular avec col rond et manches courtes - 5,95€",water_footprint: 3,carbon_footprint: 5,brand: zara,gender: men,category: categories['T-shirt'])
url = "https://res.cloudinary.com/be-better-hotels/image/upload/v1542974404/tshirthomme-zara.jpg"
product.remote_photo_url = url
product.save!
# https://www.zara.com/fr/fr/t-shirt-basique-coupe-regular-p09240330.html?v1=8188049&v2=1079339

product2 =  Product.new(
                      ean: 2280201379626,
                      name: "Sweater Sesame Street",
                      description: "Sweat à capuche kaws x Sesame Street femme",
                      water_footprint: 0,
                      brand: Brand.all[rand(0..135)],
                      gender: women,
                      category: categories['Sweater'],
                      material: materials['Wool'],
                      country: countries['India'],
                      price: 25,
                      )
url = "https://res.cloudinary.com/be-better-hotels/image/upload/v1542974404/sweater-femme-uniqlo.jpg"
product2.remote_photo_url = url
product2.save!
# https://www.uniqlo.com/fr/fr/product/sweat-a-capuche-kaws-x-sesame-street-femme-416097.html?dwvar_416097_size=SMA002&dwvar_416097_color=COL69&cgid=IDhooded-sweatshirts1243

product3 =  Product.new(
                      ean: 5670201379622,
                      name: "Pantalon flare",
                      description: "Pantalon flare velours côtelé",
                      water_footprint: 0,
                      brand: Brand.all[rand(0..135)],
                      gender: men,
                      category: categories['Trouser'],
                      material: materials['Cotton'],
                      country: countries['China'],
                      price: 60,
                      )
url = "https://res.cloudinary.com/be-better-hotels/image/upload/v1542974404/pantalon-velour-femme-Mango.jpg"
product3.remote_photo_url = url
product3.save!
# https://shop.mango.com/fr/femme/pantalons/pantalon-flare-velours-cotele_31088805.html?c=09&n=1&s=prendas_she.familia;26,326,22,322

product4 =  Product.new(
                      ean: 5645671379625,
                      name: "Jupe crayon",
                      description: "jupe crayon taille haute laine mélangée femme - Notre minijupe à carreaux fait bel effet avec un legging. En laine mélangée de belle épaisseur, idéale par temps froid. La doublure permet de l’enfiler facilement.",
                      water_footprint: 0,
                      brand: Brand.all[rand(0..135)],
                      gender: women,
                      category: categories['Skirt'],
                      material: materials['Polyester'],
                      country: countries['China'],
                      price: 30,
                      )
url = "https://res.cloudinary.com/be-better-hotels/image/upload/v1543334115/jupe-uniqlo.jpg"
product4.remote_photo_url = url
product4.save!
# https://www.uniqlo.com/fr/fr/product/jupe-crayon-taille-haute-laine-melangee-femme-409971.html?dwvar_409971_size=SMA002&dwvar_409971_color=COL04&cgid=
product5 =  Product.new(
                      ean: 8976371379620,
                      name: "Robe Hali Tiger",
                      description: "La robe Hali Tiger est une pièce extrêmement flatteuse et élégante. Entièrement fabriquée dans une matière voilée au design tigré, la robe arbore une coupe slim à manches courtes et col tortue.",
                      water_footprint: 0,
                      brand: Brand.all[rand(0..135)],
                      gender: women,
                      category: categories['Dress'],
                      material: materials['Polyester'],
                      country: countries['Japan'],
                      price: 200,
                      )
url = "https://res.cloudinary.com/be-better-hotels/image/upload/v1543485147/kk9t6yz8c7ozralz9ufh.jpg"
product5.remote_photo_url = url
product5.save!

product6 =  Product.new(
                      ean: 7896543234568,
                      name: "Beret Laulhere",
                      description: "Beret en laine vierge mérinos, taille unique. Il sajuste à toutes les têtes. Le cadeau idéal pour elle et lui.",
                      water_footprint: 0,
                      brand: Brand.all[rand(0..135)],
                      gender: women,
                      category: categories['Hat'],
                      material: materials['Wool'],
                      country: countries['France'],
                      price: 70,
                      )
url = "https://res.cloudinary.com/be-better-hotels/image/upload/v1543497338/268b43670654b2a40.jpg"
product6.remote_photo_url = url
product6.save!

product7 =  Product.new(
                      ean: 7738502234564,
                      name: "Veste Real Madrid ultimate",
                      description: "Les joueurs du Real Madrid portent cette veste de football lorsqu'ils font face aux médias pendant les matchs européens. Cette version slim est conçue en ripstop résistant qui évacue la transpiration.",
                      water_footprint: 0,
                      brand: Brand.all[rand(0..135)],
                      gender: women,
                      category: categories['Jacket'],
                      material: materials['Polyester'],
                      country: countries['Cambodia'],
                      price: 84.95,
                      )
url = "https://res.cloudinary.com/be-better-hotels/image/upload/v1543501079/survetAdidas.png"
product7.remote_photo_url = url
product7.save!

product8 =  Product.new(
                      ean: 3124597378469,
                      name: "Pyjama",
                      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      water_footprint: 0,
                      brand: Brand.all[rand(0..135)],
                      gender: kids,
                      category: categories['Pyjama'],
                      material: materials['Cotton'],
                      country: countries['USA'],
                      price: 19.95,
                      )
url = "https://res.cloudinary.com/be-better-hotels/image/upload/v1543502250/gap-pijama.png"
product8.remote_photo_url = url
product8.save!

product9 =  Product.new(
                      ean: 3124595679438,
                      name: "Straight Denim Medium Wash Jean",
                      description: "Rapid Movement Denim: Engineered for comfort and mobility, this innovative fabric looks like traditional denim but is fortified with advanced stretch that moves with you.",
                      water_footprint: 0,
                      brand: Brand.all[rand(0..135)],
                      gender: men,
                      category: categories['Jeans'],
                      material: materials['Cotton'],
                      country: countries['Vietnam'],
                      price: 99.95,
                      )
url = "https://res.cloudinary.com/be-better-hotels/image/upload/v1543503005/cn14721880.jpg"
product9.remote_photo_url = url
product9.save!

product10 =  Product.new(
                      ean: 3124595567391,
                      name: "Loose socks rayées",
                      description: "Socks rayées à angle droit en coton mélangé bio, Gris, 25-27cmMailles à 90 degrés pour sadapter à la forme du talon, sans élastique en haut. Avec effet désodorisant.",
                      water_footprint: 0,
                      brand: Brand.all[rand(0..135)],
                      gender: men,
                      category: categories['Socks'],
                      material: materials['Cotton'],
                      country: countries['Japan'],
                      price: 4.95,
                      )
url = "https://res.cloudinary.com/be-better-hotels/image/upload/v1543503300/mujiSocks.jpg"
product10.remote_photo_url = url
product10.save!

product11 =  Product.new(
                      ean: 3124914027391,
                      name: "Gilet jaune",
                      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      water_footprint: 0,
                      brand: Brand.all[rand(0..135)],
                      gender: men,
                      category: categories['Jacket'],
                      material: materials['Polyester'],
                      country: countries['France'],
                      price: 0.95,
                      )
url = "https://res.cloudinary.com/be-better-hotels/image/upload/v1543504316/gillet_jaune.jpg"
product11.remote_photo_url = url
product11.save!



puts "Created products"
5.times { 
  review_product = Review.new(
    product: Product.first,
    content: "cool",
    stars: rand(1..5)
  )
  review_product.save!

}
