class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
   # @order_address = OrderAddress.new
  end

  def create
  
  end
  
  # def create
  #   @order_address = OrderAddress.new(order_params)
  #   if @order_address.valid?
  #     @order_address.save
  #     redirect_to root_path
  #   else
  #     render :index
  #   end

  # end
  
  # private

  # def order_params
  #   params.require(:order_params).permit(:postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number, :purchase_id).merge(user_id: current_user.id)
  # end

end

