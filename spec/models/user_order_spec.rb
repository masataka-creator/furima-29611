require 'rails_helper'

RSpec.describe UserOrder, type: :model do
    before do
      @user_order = FactoryBot.build(:user_order)
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
      @user_order.user_id = @user.id
      @user_order.item_id = @item.id
      sleep(1)
    end

describe '商品購入機能' do
  context '新規登録がうまくいくとき' do
    it '全ての情報がが存在すれば登録できること' do
      expect(@user_order).to be_valid
    end

    it 'building_nameは空でも購入できる' do
      @user_order.building_name = nil
      expect(@user_order).to be_valid
    end
  end

    context '商品購入がうまくいかないとき' do
      it 'クレジットカード情報(token)が空である場合は購入出来ない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end

      it 'phone_numが空である場合は購入出来ない' do
        @user_order.phone_num = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone num is invalid")
      end

      it 'phone_numにハイフンが含まれていない場合は購入出来ない' do
        @user_order.phone_num = 1234567
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone num is invalid")
      end

      it 'phone_numが全角数字である場合は購入出来ない' do
        @user_order.phone_num = '１２３４５６７'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone num is invalid")
      end

      it 'phone_numが3桁-4桁でない場合は購入出来ない' do
        @user_order.phone_num = '1234-567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone num is invalid")
      end

      it 'prefecture_idが1である場合は購入出来ない' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空である場合は購入出来ない' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end

      it 'telephoneが空である場合は購入出来ない' do
        @user_order.telephone = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Telephone is invalid")
      end

      it 'telephoneが全角数字である場合は購入出来ない' do
        @user_order.telephone = '０９０１２３４５６７８'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Telephone is invalid")
      end

      it 'telephoneが11桁よりも多い場合は購入出来ない' do
        @user_order.telephone = '090123456789'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Telephone is too long (maximum is 11 characters)")
      end

      it '購入情報(user_id)が紐付いていない場合は購入出来ない' do
        @user_order.user_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end

      it '購入情報(item_id)が紐付いていない場合は購入出来ない' do
        @user_order.item_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end