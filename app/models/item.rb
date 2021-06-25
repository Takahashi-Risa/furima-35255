class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :scheduled_delivery
  belongs_to :prefecture
  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :name
    validates :image
    validates :info
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  end

  with_options numericality: { other_than: 1 }, presence: true do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :scheduled_delivery_id
    validates :prefecture_id
  end
end
