class BuyItem
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'Input only number' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    BuyersInfo.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, order_id: order.id)
  end
end