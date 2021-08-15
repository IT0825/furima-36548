class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :city
    validates :block
    validates :building
    validates :user_id
    validates :item_id
    with_options format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" } do
      validates :postcode
    end
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :prefecture_id
    end
    with_options numericality: { with: /\A\d{10}$|^\d{11}\z/ } do
      validates :phone_number
    end

    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order_id)
    end
end