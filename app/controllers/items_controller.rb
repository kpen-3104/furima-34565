class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.all.includes(:user).order(created_at: 'DESC')
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

  def delivery_fee
    binding.pry
    @item = Item.find_by(delivery_fee_id: params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :category_id, :item_condition_id, :delivery_fee_id,
                                 :shipping_area_id, :day_to_ship_id, :item_price).merge(user_id: current_user.id)
  end
end
