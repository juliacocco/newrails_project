class OrdersController < ApplicationController
before_action :set_order, only: [:show, :increase, :decrease, :rating_update]
  def show
    @product = Product.find(Offer.find(@order.offer_id).product_id)
    @shop = Shop.find(Offer.find(@order.offer_id).shop_id)
    @marker = [{
      lng: @shop.longitude,
      lat: @shop.latitude
    }]
  end

  def create
    offer = Offer.find(params[:offer_id])
    order = Order.create!(offer_id: offer.id, price_snapshot: offer.price_cents, user: current_user)

    redirect_to new_offer_order_payment_path(offer.id, order)
  end

  def increase
    @offer = Offer.find(params[:offer_id])
    @order.units += 1
    @order.save
    render "order_update"
    # rails will now render the JS view
  end # now we need to update the DOM

  def decrease
    @order.units -= 1
    @order.save
    render "order_update"
  end # now we need to update the DOM

  def rating_update
    @order.rating = params[:rating].to_i
    @order.save

    @offers_of_that_product = Offer.where(product_id: @order.offer.product.id)
    @ids_of_that_product = []
        @offers_of_that_product.each do |offer|
        if @ids_of_that_product.include?(offer.id)
        else
          @ids_of_that_product << offer.id
        end
        end
    @orders_of_that_product = Order.where(offer_id: @ids_of_that_product).where.not(rating: 0)
    product_aux = @order.offer.product
    average_rating_aux = 0
    @orders_of_that_product.each do |x|
      average_rating_aux += x.rating.to_f / @orders_of_that_product.count
    end
    product_aux.update(average_rating: average_rating_aux)
    @order.offer.product.update(numbervote: @orders_of_that_product.count)
  end

  private

  def order_params
    params.require(:order).permit(:price_snapshot, :payment_info, :offer_id, :user_id)
  end

  def set_user
    @user = current_user
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
