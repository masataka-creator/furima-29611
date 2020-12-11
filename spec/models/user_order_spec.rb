require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '商品購入機能' do
    context '新規登録がうまくいくとき' do
      it '全ての情報がが存在すれば登録できること' do
        expect(@user_order).to be_valid
      end

      it 'building_nameは空でも購入できる' do
        @user_order.building_name = '' # building_nameの値を''にする
        expect(@user_order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'クレジットカード情報(token)が空である場合は購入出来ない' do
        @user_order.token = '' # tokenの値を''にする
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include
      end

      it '郵便番号が空である場合は購入出来ない' do
        @user_order.phone_num = '' # phone_numの値を''にする
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone num is invalid')
      end

      it '郵便番号にハイフンが含まれていない場合は購入出来ない' do
        @user_order.phone_num = 1234567 # phone_numの値をハイフンの含まない半角数字にする
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone num is invalid')
      end

      it '郵便番号が全角数字である場合は購入出来ない' do
        @user_order.phone_num = '１２３４５６７' # phone_numの値を全角数字にする
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone num is invalid')
      end

      it '郵便番号が3桁-4桁でない場合は購入出来ない' do
        @user_order.phone_num = '1234-567' # phone_numの値を4桁-3桁にする
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone num is invalid')
      end

      it 'prefecture_idが1である場合は購入出来ない' do
        @user_order.prefecture_id = 1 # prefecture_idの値を1にする
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'cityが空である場合は購入出来ない' do
        @user_order.city = '' # cityの値を''にする
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end

      it 'telephoneが空である場合は購入出来ない' do
        @user_order.telephone = '' # telephoneの値を''にする
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Telephone is invalid')
      end

      it 'telephoneが全角数字である場合は購入出来ない' do
        @user_order.telephone = '０９０１２３４５６７８' # telephoneの値を全角数字にする
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Telephone is invalid')
      end

      it 'telephoneが11桁よりも多い場合は購入出来ない' do
        @user_order.telephone = '090123456789' # telephoneの値を10桁にする
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Telephone is too long (maximum is 11 characters)')
      end

      it '購入情報(user_id)が紐付いていない場合は購入出来ない' do
        @user_order.user_id = '' # user_idの値を''にする
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end

      it '購入情報(item_id)が紐付いていない場合は購入出来ない' do
        @user_order.item_id = '' # item_idの値を''にする
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
