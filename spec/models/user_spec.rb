require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '新規入力項目全てが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailに＠を含まない場合は登録できない ' do
      @user.email = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'first_nameが全角以外では登録できない' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include  "First name is invalid"
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'last_nameが全角以外では登録できない' do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include  "Last name is invalid"
    end
    it 'kana_first_nameが空では登録できない' do
      @user.kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana first name can't be blank"
    end
    it 'kana_first_nameが全角カタカナ以外では登録できない' do
      @user.kana_first_name = 'あいう',"123","katakana","ｶﾀｶﾅ"
      @user.valid?
      expect(@user.errors.full_messages).to include  "Kana first name is invalid"
    end
    it 'kana_last_nameが空では登録できない' do
      @user.kana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana last name can't be blank"
    end
    it 'kana_last_nameが全角カタカナ以外では登録できない' do
      @user.kana_last_name = 'あいう',"123","katakana","ｶﾀｶﾅ"
      @user.valid?
      expect(@user.errors.full_messages).to include  "Kana last name is invalid"
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
    it 'passwordが6文字以下では登録できない' do
      @user.password = 'a123'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'passwordが英字だけでは登録できない' do
      @user.password = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'passwordが数字だけでは登録できない' do
      @user.password = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'passwordが全角文字を含むと登録できない' do
      @user.password = 'ＡB12345'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'passwordがpassword_confirmationと合致しないと登録できない' do
      @user.password_confirmation = 'aaasss7777'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
  end 
  end
end
