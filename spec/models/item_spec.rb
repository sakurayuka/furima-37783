require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
   context '新規登録できるとき' do
    it '新規入力項目全てが存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end 
   context "商品新規登録できないとき" do
    it "item_nameが空だと登録できない" do
      @item.item_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Item name can't be blank"
    end
    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it "explanationが空だと登録できない" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Explanation can't be blank"
    end
    it "categoryが空だと登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it "conditionが空だと登録できない" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end    
    it "postage_statusが空だと登録できない" do
      @item.postage_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Postage status can't be blank"
    end    
    it "prefが空だと登録できない" do
      @item.pref_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Pref can't be blank"
    end    
    it "day_to_shipが空だと登録できない" do
      @item.day_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Day to ship can't be blank"
    end
    it "priceが空だと登録できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank", "Price is invalid", "Price is not included in the list"
    end
    it "priceが300円以下だと登録できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include  "Price is not included in the list"
    end
    it "priceが10000000円以上だと登録できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include  "Price is not included in the list"
    end
    it "priceが全角入力だと登録できない" do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include  "Price is not included in the list"
    end
    it "userが紐付いていなければ登録できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end

  end
end
end

#①アクティブストレージを使用した画像の設定の仕方（factorybot）
#②アクティブストレージを使用したテストの仕方（spec）