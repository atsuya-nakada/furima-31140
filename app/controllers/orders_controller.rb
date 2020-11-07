class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index ]
  def index
    @order = UserOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = UserOrder.new(order_params)
    @item = Item.find(params[:item_id])
    #binding.pry
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  def order_params
    @item = Item.find(params[:item_id])
    params.require(:user_order).permit(:city, :postal_code, :prefecture_id, :building_name, :house_number, :phone_number, :order_id).merge(user_id: current_user.id, item_id: @item[:id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end
end
