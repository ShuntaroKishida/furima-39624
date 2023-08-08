class PaymentsShippings
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id

  validates :postal, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "を（ー：ハイフン）を入れて正確に入力してください" }
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :city,    presence: true
  validates :address, presence: true
  validates :phone,   presence: true, format: { with: /\A[0-9]{10,11}\z/, message: "を（ー：ハイフン）を入れないで正確に入力してください" }
  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
    payment = Payment.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal: postal, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, payment_id: payment.id)
  end
end