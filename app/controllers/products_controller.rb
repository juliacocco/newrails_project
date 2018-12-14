class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    # Create a new offer based on the product with the bar code that the user has introduced
    if Product.where(bar_code: @product.bar_code).last == nil && @product.save == false
      redirect_to new_product_path(hidden_tag: @product.bar_code)
    # Create a new product
    elsif @product.save
      redirect_to new_offer_path(hidden_tag: @product.id)
    # If product exists
    elsif Product.where(bar_code: @product.bar_code).last != nil
      redirect_to new_offer_path(hidden_tag: Product.where(bar_code: @product.bar_code).last.id)
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:bar_code, :model, :brand, :category, :product_type, :specs, :average_rating, :photo, :user_id)
  end
end
