class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end
  
  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end

  end
  
  private

  def order_params
    params.require(:order_address).permit(:postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number, :order_id).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: Item.find(params[:item_id]).item_price,
          card: order_params[:token],
          currency: 'jpy'
        )
  end
end
