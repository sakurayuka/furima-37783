class TradesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :own_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :trade_present, only: [:index, :create]
  
  def index
    @trade_address = TradeAddress.new
  end

  def create
    @trade_address = TradeAddress.new(trade_params)
    if @trade_address.valid?
      pay_item
      @trade_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def trade_present
    if @item.trade.presence
      redirect_to root_path
    end
  end

  private

  def trade_params
    params.require(:trade_address).permit(:post_code, :pref_id, :city_name, :house_number, :building_name, :phone_number).merge(user_id: current_user.id , item_id: params[:item_id], token: params[:token])
  end

  def own_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: trade_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end



 end


