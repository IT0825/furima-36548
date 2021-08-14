class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :orders, :user_id, :item_id
end