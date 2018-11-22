class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new(ean: params[:ean])
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product), notice: "Product was successfully created!"
    else
      render "new"
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :water_footprint, :carbon_footprint, :brand_id, :category_id, :gender_id)
  end
end
