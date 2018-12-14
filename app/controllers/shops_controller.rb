class ShopsController < ApplicationController
  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      current_user.shop_id = @shop.id
      current_user.save
      redirect_to profiles_path
    else
      render :new
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:commercial_name, :legal_name, :company_number, :address, :photo)
  end
end
