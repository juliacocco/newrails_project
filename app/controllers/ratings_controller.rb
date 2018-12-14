class RatingsController < ApplicationController
  def new
    @product = Product.find(rating_params)
  end

  def create
    @rating = Rating.new(rating_params)
    @user = current_user
    if @rating.save
      redirect_to profiles_path(@user)
    else
      render :new
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:stars, :product_id)
  end
end
