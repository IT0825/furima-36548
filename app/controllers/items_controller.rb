class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description_of_item,:category_id, :product_condition_id, :shipping_fee_burden_id, :prefecture_id, :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
