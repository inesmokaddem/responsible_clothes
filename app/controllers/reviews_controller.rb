class ReviewsController < ApplicationController
  def new
    # we need @restaurant in our `simple_form_for`
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
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

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end
end
