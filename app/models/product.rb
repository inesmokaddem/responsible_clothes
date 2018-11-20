class Product < ApplicationRecord
  enum gender: [:women, :men, :child]
  belongs_to :brand
  has_many :favorites
  CATEGORY = {
    women: ['Dress', 'T-shirt', 'Shirt/Blouse', 'Blazer', 'Sweatshirt', 'Sweater', 'Jacket', 'Trouser', 'Jumpsuit', 'Skirt', 'Shoes', 'Short', 'Swimwear', 'Lingerie', 'Socks', 'Pijama', 'Coat', 'Gloves'],
    men: ['Sweatshirt', 'Shirt', 'Trouser', 'Sweater', 'Jacket', 'T-shirt', 'Blazer', 'Shoes', 'Underwear', 'Short', 'Swimwear', 'Socks', 'Gloves', 'Pijama'],
    child: ['Dress', 'T-shirt', 'Shirt', 'Jacket', 'Socks', 'Swimwear', 'Short', 'Shoes', 'Sweater', 'Sweatshirt', 'Blazer', 'Body', 'Coat', 'Gloves', 'Trouser', 'Jumpsuit', 'Legging', 'Pijama', 'Skirt']
  }

  validates :name, presence: true
  validates :description, presence: true
  validates :gender, presence: true
  validates :category, presence: true
  validates :water_footprint, presence: true
  validates :carbon_footprint, presence: true
end
