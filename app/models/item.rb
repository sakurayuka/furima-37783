class Item < ApplicationRecord

# belongs_to : user
# has_one : trade
has_one_attached :image

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category, :condition, :postage_status, :pref, :day_to_ship

validates :item_name, :price, :explanation, presence: true

validates :category_id, :condition_id, :postage_status_id, :pref_id, :day_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}


end
