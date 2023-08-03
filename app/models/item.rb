class Item < ApplicationRecord
  has_one :payment
  belongs_to :user
  has_many_attached :images

  validates :name, presence: true
  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 3, message: "は1枚以上3枚以下にしてください" }
  validates :explain, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1, message: "を選択してください" }
  belongs_to :condition
  validates :condition_id, numericality: { other_than: 1, message: "を選択してください" }
  belongs_to :charge
  validates :charge_id, numericality: { other_than: 1, message: "を選択してください" }
  belongs_to :prefecture
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
  belongs_to :criterion
  validates :criterion_id, numericality: { other_than: 1, message: "を選択してください" }
end
