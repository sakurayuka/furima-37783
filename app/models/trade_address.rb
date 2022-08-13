class TradeAddress
  include ActiveModel::Model
  attr_accessor :post_code, :pref_id, :city_name, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :pref_id, numericality: {other_than: 1 , message: "can't be blank"}
    validates :city_name
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/ , message: "is invalid"}
  end

  def save
    # 売買情報を保存し、変数tradeに代入する.itemを購入したuser
    trade = Trade.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    Address.create(post_code: post_code, pref_id: pref_id, city_name: city_name, house_number: house_number, building_name: building_name, phone_number: phone_number, trade_id: trade.id)
  end
end