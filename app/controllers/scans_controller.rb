class ScansController < ApplicationController
  def new
  end

  def create
    @product = Product.find_by(scan_params)
    if @product
      redirect_to product_path(@product)
    else
      redirect_to new_product_path(scan_params)
    end
  end

  private

  def scan_params
    params.require(:scan).permit(:ean)
  end
end
