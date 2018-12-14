class PaymentsController < ApplicationController
  before_action :set_order
  def new
    @offer = Offer.find(@order.offer_id)
    @product = Product.find(@offer.product_id)
  end

  def create
    @order.offer.update(stock: @order.offer.stock - @order.units)
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @order.price_snapshot,
      description:  "Payment for offer with order id #{@order.id} for order #{@order.id}",
      currency:     Offer.where(id: @order.offer_id).last.price.currency
    )

    @order.update(payment_info: charge.to_json)
    redirect_to offer_order_path(@order.id, @order)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_offer_order_payment_path(@order.offer_id, @order)
  end

  private

  def set_order
    @order = current_user.orders.all.find(params[:order_id])
  end
end
