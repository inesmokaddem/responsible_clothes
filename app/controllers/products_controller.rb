class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new(ean: params[:ean])
  end

  def create
    @product = Product.new(product_params)
    url = 'https://images.unsplash.com/photo-1523199455310-87b16c0eed11?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9fcaaa4eadd5aa31d26098baf3fed030&auto=format&fit=crop&w=1350&q=80'
    @product.remote_photo_url = url if @product.photo.url.nil?
    if @product.save
      redirect_to product_path(@product), notice: "Product was successfully created!"
    else
      render "new"
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :photo, :category, :water_footprint, :carbon_footprint, :brand_id, :gender_id, :category_id, :ean)
  end
end
