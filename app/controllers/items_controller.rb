class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit ]
  before_action :set_tweet, only: [:edit, :show, :update, :destroy]
  def index
    @items = Item.order("created_at DESC")
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
  end

  def edit
    if user_signed_in? && current_user.id != @item.user_id
      redirect_to action: :index
    end 
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id 
      @item.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :handleng_time_id, :price, :image ).merge(user_id: current_user.id)
  end

  def set_tweet 
    @item = Item.find(params[:id])
  end
end
