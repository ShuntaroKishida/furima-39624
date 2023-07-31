class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item

  def index
    unless Payment.exists?(item_id: @item.id) || @item.user.id == current_user.id
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @payment_shipping = PaymentsShippings.new
    else
      redirect_to root_path
    end
  end

  def create
    @payment_shipping = PaymentsShippings.new(payment_params)
    if @payment_shipping.valid?
      pay_item
      @payment_shipping.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def payment_params
    params.require(:payments_shippings).permit(:postal, :prefecture_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    item = Item.find(params[:item_id])
    price = item.price
    Payjp::Charge.create(
      amount: price,  # 商品の値段
      card: payment_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
