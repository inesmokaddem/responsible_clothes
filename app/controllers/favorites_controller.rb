class FavoritesController < ApplicationController
  def index
    @products = current_user.products
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.product = Product.find(params[:product_id])
    @favorite.user = current_user

    if @favorite.save
      redirect_to favorite_path(@favorite.product), notice: 'A favorite was successfully created'
    else
      render 'products/show'
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit()
  end

end
