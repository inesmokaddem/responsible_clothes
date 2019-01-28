class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   mount_uploader :avatar, PhotoUploader


  has_many :favorites
  has_many :reviews
  has_many :products, through: :favorites

  # before_create :default_avatar

  validates :first_name, uniqueness: { scope: :last_name }


  def has_favorited?(product)
    favorites.find_by(product: product).present?
  end

  def has_reviewed?(product)
    reviews.any? { |review| review.product == product  }
  end

  def review(product)
    reviews.find { |review| review.product == product  }
  end

  private

  # def default_avatar
  #   if avatar.nil?
  #    avatar = "https://res.cloudinary.com/dualhyg5v/image/upload/v1548434374/avatar_default.png"
  #   puts "set default avatar"
  #   end
  # end

end
