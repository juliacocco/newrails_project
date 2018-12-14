class ProfilesController < ApplicationController
  def show
    set_shop
    set_user
    set_category
    if @shop.nil? != true
      @offers = Offer.where(shop_id: @shop.id)
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_shop
    if current_user.shop_id.nil? != true
    @shop = Shop.find(current_user.shop_id)
    end
  end

  def set_category
    @list_of_category = []
    Product.all.each do |product|
      @list_of_category << product.category unless product.offers.empty?
    end
  end
end
