class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:id])
  end

  def order_params
    params.require(:order).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def address_params
    params.permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(order_id: @order.id)
  end
end
