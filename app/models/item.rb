class Item < ApplicationRecord
  has_one :payment
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :image, presence: true
  validates :explain, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  belongs_to :condition
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  belongs_to :charge
  validates :charge_id, numericality: { other_than: 1, message: "can't be blank" }
  belongs_to :prefecture
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  belongs_to :criterion
  validates :criterion_id, numericality: { other_than: 1, message: "can't be blank" }
end
