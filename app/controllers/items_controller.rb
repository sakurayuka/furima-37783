class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :own_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :trade_present, only: [:edit, :destroy]


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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def trade_present
    if @item.trade.presence
      redirect_to root_path
    end
  end

  private
  def item_params
   params.require(:item).permit(:image, :item_name, :explanation, :price, :category_id, :condition_id, :postage_status_id, :day_to_ship_id, :pref_id).merge(user_id: current_user.id)
  end

  def own_item
   @item = Item.find(params[:id])
  end

end
