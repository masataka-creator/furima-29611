require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe '商品登録機能' do

  it '商品名が空だと登録できない' do
    @item.name = '' # nameの値を空にする
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")

  end

  it '商品名が41文字以上だと登録できない' do
    @item.name = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' # nameの値を41にする
    @item.valid?
    expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
  end

  it '商品の説明が1001文字以上だと登録できない' do
    @item.description = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' # descriptionの値を1001にする
    @item.valid?
    expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
  end

  it '商品の説明が空だと登録できない' do
    @item.description = '' #descriptionの値を空にする
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end

  it '商品のカテゴリーが空だと登録できない' do
    @item.category_id = '1' #category_idの値を1にする
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 1")
  end

  it '商品の状態が空だと登録できない' do
    @item.condition_id = '1' #condition_idの値を1にする
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition must be other than 1")
  end

  it '配送料の負担が空だと登録できない' do
    @item.delivery_charge_id = '1' #delivery_chargeの値を1にする
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
  end

  it '発送元の地域が空だと登録できない' do
    @item.delivery_area_id = '1' #delivery_areaの値を1にする
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery area must be other than 1")
  end

  it '発送までの日数が空だと登録できない' do
    @item.delivery_days_id = '1' #delivery_daysの値を1にする
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery days must be other than 1")
  end

  it '価格が空だと登録できない' do
    @item.price = '' # priceの値を空にする
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it '価格が全角数字だと登録できない' do
    @item.price = '３００' # priceの値を全角数字にする
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
  end

  it '価格が299円以下だと登録できない' do
    @item.price = '299' # priceの値を299にする
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than 300")
  end

  it '価格が100000000以上だと登録できない' do
    @item.price = '100000000' # priceの値100000000をにする
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than 10000000")

  end
 end
end


