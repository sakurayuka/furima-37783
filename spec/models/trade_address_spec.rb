require 'rails_helper'

RSpec.describe TradeAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @trade_address = FactoryBot.build(:trade_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@trade_address).to be_valid
      end
      it 'buildingが空でも保存できること' do
        @trade_address.building_name = ''
        expect(@trade_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @trade_address.token = ''
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'user_idが空だと保存できないこと' do
        @trade_address.user_id = ''
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空だと保存できないこと' do
        @trade_address.item_id = ''
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include "Item can't be blank"
      end      
      it 'post_codeが空だと保存できないこと' do
        @trade_address.post_code = ''
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include "Post code can't be blank"
      end
      it 'post_codeにハイフンがないと保存できないこと' do
        @trade_address.post_code = '00000000'
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include "Post code is invalid. Include hyphen(-)"
      end
      it 'pref_idが空だと保存できないこと' do
        @trade_address.pref_id = 1
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include "Pref can't be blank"
      end
      it 'city_nameが空だと保存できないこと' do
        @trade_address.city_name = ''
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include "City name can't be blank"
      end
      it 'house_numberが空だと保存できないこと' do
        @trade_address.house_number = ''
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include "House number can't be blank"
      end
      it 'phone_numberが空だと保存できないこと' do
        @trade_address.phone_number = ''
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが全角だと保存できないこと' do
        @trade_address.phone_number = '１２３４５６７８９００'
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include "Phone number is invalid"
      end
      it 'phone_numberが10桁以下だと保存できないこと' do
        @trade_address.phone_number = '123'
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include "Phone number is invalid"
      end
      it 'phone_numberがハイフンを含むと保存できないこと' do
        @trade_address.phone_number = '123-2222-23'
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include "Phone number is invalid"
      end
      it 'phone_numberが11桁以上だと保存できないこと' do
        @trade_address.phone_number = '1111111111111'
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include "Phone number is invalid"
      end
    end
  end
end