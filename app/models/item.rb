class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :description_of_item
    validates :category_id
    validates :product_condition_id
    validates :shipping_fee_burden_id
    validates :prefecture_id
    validates :day_to_ship_id
    validates :price
  end
end
