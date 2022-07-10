require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
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
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank", "First name is invalid"
    end
    it 'first_nameが全角以外では登録できない' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include  "First name is invalid"
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank", "Last name is invalid"
    end
    it 'last_nameが全角では登録できない' do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include  "Last name is invalid"
    end
    it 'kana_first_nameが空では登録できない' do
      @user.kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana first name can't be blank", "Kana first name is invalid"
    end
    it 'kana_first_nameが全角カタカナ以外では登録できない' do
      @user.kana_first_name = 'あいう',"123","katakana","ｶﾀｶﾅ"
      @user.valid?
      expect(@user.errors.full_messages).to include  "Kana first name is invalid"
    end
    it 'kana_last_nameが空では登録できない' do
      @user.kana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana last name can't be blank", "Kana last name is invalid"
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
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordがpassword_confirmationと合致しないと登録できない' do
      @user.password_confirmation = 'aaasss7777'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end
end
