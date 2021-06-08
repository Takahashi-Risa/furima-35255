class Item < ApplicationRecord
  belongs_to :user
  has_one :records_of_order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :info
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :schedulued_delivery_id
    validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid"}
    validates :user
    validates :prefecture_id
  end

  private

  def message_params
    params.require(:item).permit(:name, :image).merge(user_id: cuurent_user.index)
end
