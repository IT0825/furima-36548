class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description_of_item, :category_id, :product_condition_id,:shipping_fee_burden_id, :prefecture_id, :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
