class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
    if user_signed_in?
      if current_user.id != @item.user_id && @item.order.present?
      else
        current_user.id == @item.user_id && @item.order.present?
      end
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render root_path
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description_of_item, :category_id, :product_condition_id,
                                 :shipping_fee_burden_id, :prefecture_id, :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if current_user.id != @item.user.id
  end
end
