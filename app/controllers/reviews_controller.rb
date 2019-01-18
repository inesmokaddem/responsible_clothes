class ReviewsController < ApplicationController
  before_action :set_product

  def new
    # we need @restaurant in our `simple_form_for`
    @review = Review.new
  end

  def create

    @review = Review.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @review.product = Product.find(params[:product_id])
    @review.product = @product
    if @review.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def index
    @reviews =   @product.reviews
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:content, :stars, :title)
  end
end
