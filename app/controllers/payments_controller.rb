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

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    card = Card.find_by(user_id: current_user.id) # ユーザーのid情報を元に、カード情報を取得

    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
    @card = customer.cards.first
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
    params.require(:payments_shippings).permit(:postal, :prefecture_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer_token = current_user.card.customer_token
    item = Item.find(params[:item_id])
    price = item.price
    Payjp::Charge.create(
      amount: price,  # 商品の値段
      customer: customer_token,    # 顧客のトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
