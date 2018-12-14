class OffersController < ApplicationController
  before_action :set_offer, only: [ :show, :edit, :update, :destroy, :increase, :decrease]
  skip_before_action :authenticate_user!, only: [ :index, :show]

  def index
    if params[:query].present?
      @offers = Offer.global_search(params[:query]).sort_by { |offer| offer.price }
    else
      @offers = Offer.all.sort_by { |offer| offer.price }
    end
    # raise
  end

  def show
    @product = Product.find(@offer.product_id)
    @offer = Offer.find(params[:id])
    @product = Product.find(@offer.product_id)
    @ratings = Rating.where(["product_id = ?", @offer.product_id]).count
    @shop = Shop.find(@offer.shop_id)
    @marker = [{
      lng: @shop.longitude,
      lat: @shop.latitude
    }]
  end

  def new
    @product = Product.find(params[:hidden_tag][0])
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.shop_id = current_user.shop_id
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @offer.update(offer_params)
      redirect_to offer_path(@offer)
    else
      render :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to profiles_path
  end

  def increase
    @offer.stock += 1
    @offer.save
    render "stock_update"
    # rails will now render the JS view
  end # now we need to update the DOM

  def decrease
    @offer.stock -= 1
    @offer.stock += 1 if !@offer.save
    render "stock_update"
  end # now we need to update the DOM

  private

  def offer_params
    params.require(:offer).permit(:title, :stock, :description, :price, :product_id, :shop_id)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
