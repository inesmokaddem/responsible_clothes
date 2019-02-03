class ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = @products.where(category_id: params[:search][:category_id]) if params.dig(:search, :category_id).present?
    @products = @products.where(gender_id: params[:search][:gender_id]) if params.dig(:search, :gender_id).present?
    if params.dig(:search, :price_min).present? && params.dig(:search, :price_max).present?
      prices_cents = [params[:search][:price_min], params[:search][:price_max]].map { |price| price.to_i.round * 100 }
    end
    @products = @products.where(price_cents: prices_cents[0]..prices_cents[1]) if prices_cents

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @product = Product.find(params[:id])
    # @alternatives = Product.first(6)
    @alternatives = Product.where(category: @product.category, gender: @product.gender).order(global_rating: :desc).first(6)
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
    params.require(:product).permit(:name, :description, :price, :country, :photo, :photo_cache, :category, :material, :composition, :water_footprint, :carbon_footprint, :brand_id, :gender_id, :category_id, :material_id, :country_id, :ean)
  end
end
