class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

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
   params.require(:item).permit(:image, :item_name, :explanation, :price, :category_id, :condition_id, :postage_status_id, :day_to_ship_id, :pref_id).merge(user_id: current_user.id)
  end

end
