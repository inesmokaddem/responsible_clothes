class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   mount_uploader :avatar, PhotoUploader

  has_many :favorites
  has_many :reviews
  has_many :products, through: :favorites
  validates :first_name, uniqueness: { scope: :last_name }


  def has_favorited?(product)
    favorites.find_by(product: product).present?
  end
end
