class ScansController < ApplicationController
  def new
  end

  def create
    @product = Product.find(params[:ean])
    if @product.exists?
      redirect_to product_path(@product)
    else
      redirect_to new_product_path
      @product = Product.new(product_params)
      @product.user = current_user
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :water_footprint, :carbon_footprint, :brand_id, :category_id, :gender_id)
  end
end
