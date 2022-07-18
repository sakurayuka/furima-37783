class Item < ApplicationRecord

  validates :image, presence: true
  validates :item_name, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }
  validates_inclusion_of :price, in:300..9999999
  validates :explanation, presence: true
  validates :category_id, :condition_id, :postage_status_id, :pref_id, :day_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}

belongs_to :user
#has_one :trade
has_one_attached :image

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :condition 
belongs_to :postage_status 
belongs_to :pref
belongs_to :day_to_ship

end
