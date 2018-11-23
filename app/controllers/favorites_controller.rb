class FavoritesController < ApplicationController
  def index
    @products = current_user.products
  end

  def create
    @favorite = Favorite.new
    @favorite.product = Product.find(params[:product_id])
    @favorite.user = current_user

    @favorite.save

    respond_to do |format|
      format.js # create.js.erb
    end
  end
end
