class TransactionsController < ApplicationController
  def index
    set_user
    if @user.seller == true && @user.shop.nil?
    elsif @user.seller == true
      set_shop
      @offers = Offer.where(shop_id: @shop.id)
      @ids = []
      @offers.each do |offer|
        if @ids.include?(offer.id)
        else
          @ids << offer.id
        end
      end
      @orders = Order.where(offer_id: @ids).where.not(payment_info: nil)
    else
      @orders = Order.where(user_id: @user.id).where.not(payment_info: nil)
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
end



