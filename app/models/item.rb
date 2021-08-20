class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  def self.search(search)
    if search != ""
      Item.where('product_name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :day_to_ship

  with_options presence: true do
    validates :image
    validates :product_name
    validates :description_of_item

    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :category_id
      validates :product_condition_id
      validates :shipping_fee_burden_id
      validates :prefecture_id
      validates :day_to_ship_id
    end

    with_options numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } do
      validates :price
    end
  end
end
