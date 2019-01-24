class ReviewsController < ApplicationController
  before_action :set_product, only: [:new, :create, :index]

  def new
    # we need @restaurant in our `simple_form_for`
    @review = Review.new
  end

  def create

    @review = Review.new(review_params)
    # we need `product_id` to asssociate review with corresponding review
    @review.product = Product.find(params[:product_id])
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def index
    @reviews = @product.reviews
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)

    redirect_to product_path(@review.product)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:content, :stars, :title)
  end
end
